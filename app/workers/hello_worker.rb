class HelloWorker
  include Sidekiq::Worker

  def perform(sidekiq_plan_id)
    sidekiq_plan = SidekiqPlan.find(sidekiq_plan_id)

    sidekiq_plan.started_at = Time.current
    sidekiq_plan.started!

    puts "Hello, world!"

    sidekiq_plan.finished_at = Time.current
    sidekiq_plan.finished!

  rescue
    sidekiq_plan.finished_at = nil
    sidekiq_plan.failed_at = Time.current
    sidekiq_plan.failed!
  end
end

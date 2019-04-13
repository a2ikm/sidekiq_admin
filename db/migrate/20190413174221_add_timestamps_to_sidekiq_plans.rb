class AddTimestampsToSidekiqPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sidekiq_plans, :started_at,   :datetime, after: :status
    add_column :sidekiq_plans, :finished_at,  :datetime, after: :started_at
    add_column :sidekiq_plans, :failed_at,    :datetime, after: :finished_at
  end
end

class SidekiqPlan < ApplicationRecord
  enum status: {
    initial:  0,
    waiting:  1,
    started:  2,
    finished: 3,
    failed:   4,
  }

  def worker_class
    return @worker_class if defined?(@worker_class)
    @worker_class = worker_name.classify.constantize
  end

  def enqueue
    self.jid = worker_class.perform_async(id)
    waiting!
  end
end

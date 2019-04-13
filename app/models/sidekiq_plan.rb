class SidekiqPlan < ApplicationRecord
  enum status: {
    waiting:  0,
    started:  1,
    finished: 2,
    failed:   3,
  }
end

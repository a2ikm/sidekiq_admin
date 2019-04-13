class AddPerformAtToSidekiqPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sidekiq_plans, :perform_at, :datetime, null: false, after: :status
  end
end

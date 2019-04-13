class CreateSidekiqPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :sidekiq_plans do |t|
      t.string :label,        null: false
      t.string :worker_name,  null: false
      t.string :jid,          null: false
      t.integer :status,      null: false

      t.timestamps null: false
    end
  end
end

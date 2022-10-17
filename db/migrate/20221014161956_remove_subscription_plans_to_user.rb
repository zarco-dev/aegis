class RemoveSubscriptionPlansToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :subscription_plan_id, :bigint, foreign_key: true
  end
end

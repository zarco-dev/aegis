class RemoveUserIdToSubscriptionsPlans < ActiveRecord::Migration[7.0]
    def change
      remove_column :subscription_plans, :user_id, :bigint, foreign_key: true
    end
end

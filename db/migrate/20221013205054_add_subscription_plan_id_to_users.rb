class AddSubscriptionPlanIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :subscription_plan, null: false, foreign_key: true
  end
end

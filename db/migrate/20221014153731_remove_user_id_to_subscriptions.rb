class RemoveUserIdToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :user_id, :bigint, foreign_key: true
  end
end

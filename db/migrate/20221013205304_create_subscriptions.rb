class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.datetime :begining_date
      t.datetime :expired_date
      t.references :user, null: false, foreign_key: true
      t.references :subscription_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSubscriptionPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_plans do |t|
      t.string :title
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end

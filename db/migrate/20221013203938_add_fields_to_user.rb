class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :premium_user, :boolean, default: false
    add_column :users, :group_user, :boolean, default: false
    add_column :users, :birth_date, :datetime
    add_column :users, :cel_number, :string
  end
end

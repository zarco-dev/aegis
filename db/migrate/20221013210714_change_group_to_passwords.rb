class ChangeGroupToPasswords < ActiveRecord::Migration[7.0]
  def change
    change_column :passwords, :group, :boolean, default: false
  end
end

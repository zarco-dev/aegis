class ChangeGroupNameToPasswords < ActiveRecord::Migration[7.0]
  def change
    rename_column :passwords, :group, :isgroup
  end
end

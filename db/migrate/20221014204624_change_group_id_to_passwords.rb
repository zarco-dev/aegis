class ChangeGroupIdToPasswords < ActiveRecord::Migration[7.0]
  def change
    change_column :passwords, :group_id, :bigint, null: true, foreign_key: true
  end
end

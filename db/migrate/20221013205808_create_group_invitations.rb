class CreateGroupInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :group_invitations do |t|
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

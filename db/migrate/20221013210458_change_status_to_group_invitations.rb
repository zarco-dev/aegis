class ChangeStatusToGroupInvitations < ActiveRecord::Migration[7.0]
  def change
    change_column :group_invitations, :status, :boolean, default: false
  end
end

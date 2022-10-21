class GroupInvitationsController < ApplicationController
  before_action :find_group, only: [:new, :create]
  after_action :authorize_group_invitation

  def new
    @group_invitation = GroupInvitation.new
  end

  def create
    @group_invitation = User.find_by(email: params[:invitation])
    raise
  end

  private

  # def group_invitation_params
  #   params.permit(:invite)
  # end

  def authorize_group_invitation
    authorize @group_invitation
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end

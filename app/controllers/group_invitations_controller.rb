class GroupInvitationsController < ApplicationController
  before_action :find_group, only: [:new, :create]
  after_action :authorize_group_invitation, except: [:index]

  def index
    @group_invitations = policy_scope(GroupInvitation)
  end

  def new
    @group_invitation = GroupInvitation.new
    if params[:query].present?
      @query = params[:query]
      @usuarios = User.where("email LIKE '%#{@query}%'")
    end
  end

  def create
    @group_invitation = GroupInvitation.new(group_invitation_params)
    if @group_invitation.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_invitation_params
    params.require(:group_invitation).permit(
      :user_id,
      :group_id
    )
  end

  def authorize_group_invitation
    authorize @group_invitation
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end

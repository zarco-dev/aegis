class GroupInvitationsController < ApplicationController
  before_action :find_group, only: [:new, :create]
  after_action :authorize_group_invitation

  def index
  end

  def new
    @group_invitation = GroupInvitation.new
    if params[:query].present?
      @query = params[:query]
      @usuarios = User.where("email LIKE '%#{@query}%'")
    end
    # raise
  end

  def create
    # @group_invitation = GroupInvitation.new
    # params
    # raise
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

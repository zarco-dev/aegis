class GroupInvitationsController < ApplicationController
  before_action :find_group, only: [:new, :create, :edit, :destroy]
  after_action :authorize_group_invitation, except: [:index, :invitation]

  def index
    @group_invitations = policy_scope(GroupInvitation)
  end



  def new
    @group_invitation = GroupInvitation.new

    if params[:query].present?
      @usuarios = User.where('email ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "group_invitations/parm", locals: {usuarios: @usuarios}, formats: [:html] }
    end

  end




  def create
    @group_invitation = GroupInvitation.new(group_invitation_params)
    if @group_invitation.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def invitation
    raise
  end

  def edit
    # @group_invitation = GroupInvitation.find(params[:id])
  end

  def update
  end

  def destroy
    @group_invitation = GroupInvitation.find(params[:id])
    @group_invitation.destroy
    redirect_to invitation_path
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

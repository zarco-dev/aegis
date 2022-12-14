class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :destroy]
  after_action :authorize_group, except: [:index]

  def index
    @groups = policy_scope(Group)
    @password = policy_scope(Password)

    if params[:query].present?
      @groups = @groups.where('name ILIKE ?', "#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "groups/parm", locals: {groups: @groups}, formats: [:html] }
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :description,
    )
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def authorize_group
    authorize @group
  end
end

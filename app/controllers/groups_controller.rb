class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  after_action :authorize_group, except: [:index]

  def index
    @groups = policy_scope(Group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def show
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

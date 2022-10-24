class PasswordsController < ApplicationController
  before_action :set_pass, only: [:show, :edit, :update, :destroy]
  after_action :authorize_pass

  def show
  end

  def new
    @password = Password.new
  end

  def create
    @password = Password.new(pass_params)
    @password.user = current_user
    if @password.save
      redirect_to @password
    else
      render :new
    end
  end

  def edit
  end

  def update
    @password.update(pass_params)
    @password.save
    redirect_to dashboard_path

  end

  def destroy
    @password.destroy
    redirect_to dashboard_path
  end

  private

  def pass_params
    params.require(:password).permit(
      :url,
      :site_name,
      :category,
      :site_username,
      :site_password,
      :group_id
    )
  end

  def set_pass
    @password = Password.find(params[:id])
  end

  def authorize_pass
    authorize @password
  end
end

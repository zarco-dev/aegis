class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def upgrade
  end
  
  def index
    @password = policy_scope(Password)

    if params[:query].present?
      @password = @password.where('site_name ILIKE ?', "#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "passwords/parm", locals: {passwords: @password}, formats: [:html] }
    end
  end

  def invitation
    @group_invitation = GroupInvitation.all

    if params[:group_invitation].present?
      @result = GroupInvitation.where("id = ?", params[:group_invitation])
      @result[0].status = true
      current_user.group_user = true
      @result[0].save
      current_user.save
    end
    # raise
  end

  def time_ago_in_words(from_time, include_seconds_or_options = {})
    distance_of_time_in_words(from_time, Time.now, include_seconds_or_options)
  end

  def mygroups
  end


  def destroy
  end

  def generate
  end

end

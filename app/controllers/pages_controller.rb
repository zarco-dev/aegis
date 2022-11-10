class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def upgrade
    if params[:params].present?
      iduser = User.find(params[:params])
      iduser.premium_user = true
      iduser.subscription.subscription_plan_id = 2
      iduser.subscription.begining_date = Date.today
      iduser.subscription.expired_date = Date.today.next_month
      iduser.save
      iduser.subscription.save
      redirect_to dashboard_path
    end
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

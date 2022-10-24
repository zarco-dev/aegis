class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def index
    @password = policy_scope(Password)
  end

  def invitation
    if params[:group_invitation].present?
      @result = GroupInvitation.where("id = ?", params[:group_invitation])
      @result[0].status = true
      current_user.group_user = true
      @result[0].save
      current_user.save
    end
    # raise
  end

  def mygroups
  end
end

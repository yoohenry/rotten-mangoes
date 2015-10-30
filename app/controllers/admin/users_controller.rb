class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def restrict_admin_acess
  if !user.admin?
    flash[:alert] = "You are not an admin, fool"
    redirect_to movies_path
  end
  end
end


class Admin::UsersController < ApplicationController
  def index
    puts '*' * 50
    puts 'INDEX!'

    @user = current_user
    # binding.pry
    
    restrict_admin_acess
    # restrict_admin_access
    @users = User.all
  end

  def restrict_admin_acess
    if @user.admin == false
      flash[:alert] = "You are not an admin, fool"
      redirect_to movies_path
    end
  end
end

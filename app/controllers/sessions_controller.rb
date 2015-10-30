class SessionsController < ApplicationController

  def new
  end


  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
      if user.admin?
        session[:user_id] = user.id
      end
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end 

    def destroy
      session[:user_id] = nil
      redirect_to movies_path, notice: "Adios!"
    end 
    
end
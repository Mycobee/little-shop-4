class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to user_path(user)
    else
      @error = ["Wrong credentials, please try again."]
      render :new
    end
  end
end

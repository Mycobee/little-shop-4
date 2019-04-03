class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.role == 0
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to user_path(user)
    elsif user && user.authenticate(params[:password]) && user.role == 1
      # binding.pry
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to merchant_path(user)
    elsif user && user.authenticate(params[:password]) && user.role == 2
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to admin_path(user)
    else
      @error = ["Wrong credentials, please try again."]
      render :new
    end
  end
end

class SessionsController < ApplicationController

  def new
    user = User.find_by(params[:email])
    if user && user.role == 0
      redirect_to profile_path(user)
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.role == 0
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to profile_path(user)
    elsif user && user.authenticate(params[:password]) && user.role == 1
      # binding.pry
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to merchant_dashboard_path(user)
    elsif user && user.authenticate(params[:password]) && user.role == 2
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_to root_path
    else
      @error = ["Wrong credentials, please try again."]
      render :new
    end
  end
end

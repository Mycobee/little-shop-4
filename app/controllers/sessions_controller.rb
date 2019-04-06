class SessionsController < ApplicationController

  def new
    redirect_user if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
      redirect_user
    else
      @error = ["Wrong credentials, please try again."]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You are logged out"
  end

  private

  def redirect_user
    if current_user.default?
      redirect_to profile_path
    elsif current_user.merchant?
      redirect_to merchant_dashboard_path
    elsif current_user.admin?
      redirect_to admin_dashboard_path
    end
  end
end

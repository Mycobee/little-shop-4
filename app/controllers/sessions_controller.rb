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

  private

  def redirect_user
    if current_user.default?
      redirect_to profile_path
    elsif current_user.merchant?
      redirect_to dashboard_path
    elsif current_user.admin?
      redirect_to admin_dashboard_path
    end
  end
end

class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account successfully created, Logged in as #{@user.name}"
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip_code, :email, :password)
  end

end

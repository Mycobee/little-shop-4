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

  def update

    @user = current_user
    @user.update(user_params)
    flash[:notice] = "Profile Information Updated"
    redirect_to profile_path
  end

# name: params[:name], address: params[:address], city: params[:city], zip_code: params[:zip_code], email: params[:email], password: params[:]
  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip_code, :email, :password)
  end

end

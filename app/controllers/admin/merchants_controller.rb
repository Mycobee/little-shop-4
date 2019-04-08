class Admin::MerchantsController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user.merchant? == false
      redirect_to admin_user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.role == "default" && current_admin? == true
      @user.role = "merchant"
      if @user.save
        flash[:notice] = "#{@user.name} is now a merchant."
        redirect_to admin_merchant_path(@user)
      else
        flash[:notice] = "That request didn't work."
        redirect_to admin_user_path(@user)
      end
    else
      flash[:notice] = "That user cannot be changed."
      redirect_to admin_user_path(@user)
    end
  end
end

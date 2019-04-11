class Admin::UsersController < ApplicationController

  def index
    @users = User.where(role: 0)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @merchant = User.find(params[:id])
    if @merchant.role == "merchant" && current_admin? == true
      @merchant.role = 0
      @merchant.item_disable
      if @merchant.save
        flash[:notice] = "#{@merchant.name} is now a user."
        redirect_to admin_merchant_path(@merchant)
      else
        flash[:notice] = "That request didn't work."
        redirect_to admin_user_path(@merchant)
      end
    else
      flash[:notice] = "That user cannot be changed."
      redirect_to admin_user_path(@merchant)
    end
  end
end

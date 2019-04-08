class Admin::MerchantsController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user.merchant? == false
      redirect_to admin_user_path(@user)
    end
  end

  def change
    @merchant = User.find(params[:merchant_id])
    @merchant.enabled = false
    @merchant.save
    flash[:notice] = "Merchant account has been disabled"
    redirect_to merchants_path
  end
end

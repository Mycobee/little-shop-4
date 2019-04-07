class Admin::MerchantsController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user.merchant? == false
      redirect_to admin_user_path(@user)
    end
  end
end

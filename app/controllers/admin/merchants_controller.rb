class Admin::MerchantsController < ApplicationController

  def show
    @user = User.find(params[:id])

    if @user.role == "default" && current_admin? == true
      @user.role = "merchant"
      flash[:notice] = "#{@user.name} is now a merchant."
    end
  end
end

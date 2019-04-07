class Admin::MerchantsController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
end

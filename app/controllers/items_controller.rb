class ItemsController < ApplicationController

  def index
    if current_user == nil
      flash[:notice] = "You must register or login to finish checking out."
    end
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end

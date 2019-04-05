class ItemsController < ApplicationController

  def index
    @items = Item.all
    @merchant_name = Item.joins(:user)
  end

  def show
    @item = Item.find(params[:id])
  end

end

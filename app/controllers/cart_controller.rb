class CartController < ApplicationController

  def create
    binding.pry
    item = Item.find(params[:item])
    @cart.add_item(item)
    session[:cart] = @cart.items
    redirect_to cart_path
  end
end

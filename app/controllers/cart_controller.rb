class CartController < ApplicationController

  def show
    @cart = Cart.new
  end
end

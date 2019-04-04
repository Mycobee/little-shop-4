class CartController < ApplicationController

  def show
    @cart = Hash.new(0)
  end
end

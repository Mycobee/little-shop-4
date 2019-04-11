class User::OrdersController < ApplicationController

  def index
    @orders = Order.where()
  end
end

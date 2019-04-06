class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.items
    quantity = @cart.count_of(item.id)
    flash[:notice] = "You now have #{pluralize(quantity, "unit")} of #{item.name} in your cart."
    redirect_to items_path
  end
end

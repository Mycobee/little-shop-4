class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    item_id_str = item.id.to_s
    session[:cart] ||= Hash.new(0)
    session[:cart][item_id_str] ||= 0
    session[:cart][item_id_str] = session[:cart][item_id_str] + 1
    quantity = session[:cart][item_id_str]
    flash[:notice] = "You now have #{pluralize(quantity, "unit")} of #{item.name} in your cart."
    # @cart.add_item(item)
    # session[:cart] = @cart.items
    redirect_to items_path
  end
end

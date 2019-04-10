class ItemsController < ApplicationController

  def index
    if current_user == nil
      flash[:register_please] = "You must #{view_context.link_to('login', login_path)} or #{view_context.link_to('register', new_user_path)} to finish checking out."
    end
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @cart.update(params)
    flash[:notice] = "Cart Has Been Updated."
    redirect_to cart_path(@cart)
  end

  def destroy
    @cart.delete_item(@item)
    flash[:notice] = "Item Has Been deleted."
    redirect_to cart_path(@cart)
  end


  private

  def updated_params
    params.require(:item).permit(:quantity)
  end
end

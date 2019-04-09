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
    @item = Item.find(params[:id])
    @item.update(updated_params)
    if @item.save!
      flash[:notice] = "Cart Has Been Updated."
      if @item.quantity == 0
        @cart.delete_item(@item)
      end
      redirect_to cart_path(@cart)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.quantity = 0
    @cart.delete_item(@item)
    if @item.save!
      flash[:notice] = "Item Has Been deleted."
      redirect_to cart_path(@cart)
    end
  end


  private

  def updated_params
    params.require(:item).permit(:quantity)
  end
end

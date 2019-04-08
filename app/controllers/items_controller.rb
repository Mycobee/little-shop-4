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
end

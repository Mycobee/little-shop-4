class Dashboard::ItemsController < Dashboard::BaseController
  def index
    @user = current_user
  end

  def disable
    @item = Item.find(params[:item_id])
    @item.enabled = false
    @item.save
    flash[:notice] = "Item has been disabled"
    redirect_to dashboard_items_path
  end

  def enable
    @item = Item.find(params[:item_id])
    @item.enabled = true
    @item.save
    flash[:notice] = "Item has been enabled"
    redirect_to dashboard_items_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to dashboard_items_path
  end
end

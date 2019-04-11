class Dashboard::ItemsController < Dashboard::BaseController
  def index
    @user = current_user
  end

  def new
    @user = current_user
    @item = @user.items.new
  end
  
  def new
    @user = User.find(current_user.id)
    @item = Item.new
  end

  def create
    @user = User.find(current_user.id)
    @item = @user.items.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.name} was created"
      redirect_to dashboard_items_path
    else
      render :new
    end
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

  def fulfill
    @item = Item.find(params[:item_id])
    @item.quantity = (@item.quantity - @item.order_items.item_quantity)
    @item.order_items.each do |order_item|
      order_item.fulfilled = true
      order_item.save
    end
    @item.save
    flash[:notice] = "#{@item.name} fulfilled"
    redirect_to dashboard_order_path(@item.orders.uniq)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to dashboard_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url, :base_price, :quantity)
  end
end

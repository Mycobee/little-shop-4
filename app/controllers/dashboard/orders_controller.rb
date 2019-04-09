class Dashboard::OrdersController < Dashboard::BaseController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.items.joins(:order_items).where(user: current_user)
  end

end

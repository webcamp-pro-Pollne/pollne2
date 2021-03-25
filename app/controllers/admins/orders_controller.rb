class Admins::OrdersController < ApplicationController

  def top
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @orders_details = @order.orders_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end

class Admins::OrdersDetailsController < ApplicationController

  def update
    @orders_detail = OrdersDetail.find(params[:id])
    @orders_detail.update(orders_detail_params)
    redirect_to admins_order_path(@orders_detail.order)
  end

  private
  def orders_detail_params
  params.require(:orders_detail).permit(:making_status)
  end
end

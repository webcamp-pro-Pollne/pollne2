class Admins::OrdersDetailsController < ApplicationController

  before_action :autheniticate_admin

  def update
    @orders_detail = OrdersDetail.find(params[:id])
    @order = @orders_detail.order

    #@orders_details = @order.orders_detail
     #making_hai = []
     #@orders_detail.each do |order_detail|
     #making_hai.push(@orders_detail.read_attribute_before_type_cast(:making_status))
     #if making_hai.any?{|n| n > 2}
       #@order.status = "製作中"
      # @order.update(order_params)
     #end
    # elsif making_hai.all?{|n| n > 3}
    #   @order.status = "発送待ち"
    #   @order.update(order_params)
    # end

    @orders_detail.update(orders_detail_params)
    order_auto_status_changer(@order)
    redirect_to admins_order_path(@orders_detail.order)
  end

  private

  def orders_detail_params
    params.require(:orders_detail).permit(:making_status)
  end

  def order_params
    params.require(:order).permit(:status)
  end
  #end
end

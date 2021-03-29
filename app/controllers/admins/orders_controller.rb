class Admins::OrdersController < ApplicationController

  before_action :autheniticate_admin

  def top
    @orders = Order.page(params[:page]).reverse_order#カミナリ
  end

  def show
    @order = Order.find(params[:id])
    @orders_details = @order.orders_details
  end

  def update
    @order = Order.find(params[:id])
     @order.update(order_params)
     orders_details_auto_status_changer(@order)#関数はappcation_controllerに定義
     
      # if @order.read_attribute_before_type_cast(:status) == 1
      #   @order.orders_details.each do |order_detail|
      #     order_detail.making_status = "製作待ち"
      #     order_detail.update(making_status: order_detail.making_status)
      #   end
      # elsif @order.read_attribute_before_type_cast(:status) == 2
      #     @order.orders_details.each do |order_detail|
      #     order_detail.making_status = "製作中"
      #     order_detail.update(making_status: order_detail.making_status)
      #   end
      # elsif @order.read_attribute_before_type_cast(:status) == 3
      #     @order.orders_details.each do |order_detail|
      #     order_detail.making_status = "製作中"
      #     order_detail.update(making_status: order_detail.making_status)
      #   end
      # elsif @order.read_attribute_before_type_cast(:status) == 4
      #     @order.orders_details.each do |order_detail|
      #     order_detail.making_status = "製作完了"
      #     order_detail.update(making_status: order_detail.making_status)
      #   end
      #end

    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def orders_detail_params
    params.require(:orders_detail).permit(:making_status)
  end

end

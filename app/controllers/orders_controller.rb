class OrdersController < ApplicationController

  before_action :order_params, only: :confirm

  def new
    #Order.delete(:order)#この一文がわからない
    @order = Order.new
    @customer = current_customer
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    # @cart_items = Order.cart_items.all
  end

  def confirm
    @customer = current_customer
    @order = Order.new(@attr)
    session[:order] = @order

    # if @order.invalid? #orderの中身がない(true)のとき、newへrender
      # render :new
    # end
  end

  def done
    order.create!(session[:order])#!の意味が分からない
    order.delete(:order)
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:id,:postal_code,:address,:name,:payment_method)#変更を加えるカラムのみでいいのか
  end

end

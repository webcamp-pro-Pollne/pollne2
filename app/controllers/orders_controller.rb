class OrdersController < ApplicationController

  #before_action :order_params, only: :confirm

  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc)
    #@orders_details = @orders.orders_details
  end

  def show
    @order = Order.find(params[:id])
    #@orders_details = @order.orders_details
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping = 800 #送料
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]#こっちはf.radioでつくっているため、orderのpayment_methodで引っ張てこれる

    if params[:address_select] == "0"#自分の住所を選んだ場合,f.でラジオボタンを作ってるわけでなはいのでそのデータはorderの管轄ではない独立したものになる。よって入れ子にしないでaddress_selectで持ってこれる
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name#モデルで定義している

    elsif params[:address_select]  == "1"#登録住所から選んだ場合
      @sta = params[:order][:address_select].to_i
      @order_address = Address.find(@sta)#いつもコンソールでやってるfind(1)のようなレコード検索(登録されている住所の検索)が、上記の.to_iでできるようになっている。
      @order.postal_code = @order_address.postal_code
      @order.address = @order_address.address
      @order.name = @order_address.name

    elsif params[:address_select]  == "2"#新しいお届け先を選んだ場合
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    end

    #if @order.invalid? #orderの中身がない(true)のとき、newへrender
      #render :new
    #end
  end

  def complete
    #order.create!(session[:order])#!の意味が分からない
    #order.delete(:order)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id#FKの結びつき
    @order.status = "入金待ち"
    @order.save
    current_customer.cart_items.each do |cart_item|#cart_item一つに対してorderdetailが一つできるようにcart_itemの数だけ繰り返し処理を行う。
      OrdersDetail.create!(#seedファイルと同じ作り方、主キーとtimestamp以外を指定
        order_id: @order.id,
        item_id: cart_item.item_id,
        price: cart_item.item.tax_price,
        amount: cart_item.amount,
        making_status: "製作待ち",
        )
      end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:payment_method,:shipping,:total_payment,:status)
  end

end

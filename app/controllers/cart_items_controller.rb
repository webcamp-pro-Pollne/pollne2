class CartItemsController < ApplicationController
  
  before_action :autheniticate_customer

  # before_action :setup_cart_item!, only: [:create, :update, :destroy]

  def index
    @cart_items = current_customer.cart_items #アソシエーションを組んでいるため、idの指定なく呼び出せる。
    @numbers = [1,2,3,4,5,6,7,8,9,10]
  end

  def create # 商品一覧画面から、「商品購入」を押した時のアクション
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])#←セットアップの文章,customer_idとitem_idを参照して紐づけた(paramsでやろうとしたことを代わりにしている)
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:cart_item][:item_id])#←newとbuildは同じ意味合い
      @cart_item.amount += params[:cart_item][:amount].to_i#ここでやっとamountの紐づけ(paramsでやろうとしたこと)、trueバージョン(商品追加)
      @cart_item.save
    else
      @cart_item.update(amount: params[:cart_item][:amount].to_i)#ここでやっとamountの紐づけ(paramsでやろうとしたこと)、falseバージョン
    end
    redirect_to cart_items_path
  end

  def destroy # カート詳細画面から、「削除」を押した時のアクション
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all#カートを空にするアクション,link_toの呼び出しの際にindexアクションで定義したそのcustomerのカートアイテム(すべて)を引数として渡しているので、.allの記述はいらない
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)#更新するのはamountのみ
    redirect_to cart_items_path
  end

  private

  # def setup_cart_item!
    # @cart_item = current_cart_items.find_by(item_id: params[:item_id])
  # end

  # def current_cart_items
      # if session[:cart_item_id]
        # @cart_item = CartItem.find(session[:cart_item_id])
      # else
        # @cart_item = CartItem.new(cart_item_params)#いつものcreateアクションと同じ記述、今回はitemの詳細ページから送られてきたデータを受け取る
        # @cart_item.customer_id = current_customer.id#customerのidを紐づけないと、だれのカートアイテムなのかわからない
        # session[:cart_item_id] = @cart_item.id
      # end
  # end

  def cart_item_params#今回は使ってない(アクション内の記述で補っている)
    params.require(:cart_item).permit(:item_id,:amount,:customer_id)
  end

end

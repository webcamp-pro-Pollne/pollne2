class CartItemsController < ApplicationController

  before_action :setup_cart_item!, only: [:create, :update, :destroy]

  def index
    @cart_items = current_cart_items
    @numbers = [1,2,3,4,5,6,7,8,9,10]
  end

  def create # 商品一覧画面から、「商品購入」を押した時のアクション
    if @cart_item.blank?
      @cart_item = current_cart_items.build(product_id: params[:product_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy # カート詳細画面から、「削除」を押した時のアクション
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def update # カート詳細画面から、「削除」を押した時のアクション
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to cart_items_path
  end

  private

  def setup_cart_item!
    @cart_item = current_cart_items.find_by(product_id: params[:product_id])
  end

  def current_cart_items
      if session[:cart_item_id]
        @cart_item = CartItem.find(session[:cart_item_id])
      else
        @cart_item = CartItem.create
        session[:cart_item_id] = @cart_item.id
      end
  end
end

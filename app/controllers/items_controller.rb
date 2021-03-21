class ItemsController < ApplicationController

    def top
      @items_all = Item.all.order(created_at: :desc)
      @items = @items_all.page(params[:page]).per(4)
      @genres = Genre.all
    end

    def about
    end

    def index
      @items_all = Item.all.order(created_at: :desc)
      @items = @items_all.page(params[:page]).per(8)
      @genres = Genre.all
    end

    def show
      @item = Item.find(params[:id])
      @genres = Genre.all
      @numbers = [1,2,3,4,5,6,7,8,9,10]#個数選択をするための配列
      @cart_item = CartItem.new #個数を選択して送るフォームを作る際に必要
    end
end

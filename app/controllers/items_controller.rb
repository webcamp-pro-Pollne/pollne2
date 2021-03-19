class ItemsController < ApplicationController

    def top
      @items = Item.all.order(created_at: :desc)
      @items = Item.page(params[:page]).per(4)
      @genres = Genre.all
    end

    def about
    end

    def index
      @items = Item.all.order(created_at: :desc)
      @items = Item.page(params[:page]).per(8)
      @genres = Genre.all
    end

    def show
      @item = Item.find(params[:id])
    end
end

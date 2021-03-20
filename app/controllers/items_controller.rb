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
    end
end

class ItemsController < ApplicationController
  
    def top
      @items = Item.all
      @genres = Genre.all
    end

    def about
    end

    def index
      @items = Item.all
      @genres = Genre.all
    end

    def show
      @item = Item.find(params[:id])
    end
end

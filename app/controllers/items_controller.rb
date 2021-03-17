class ItemsController < ApplicationController
    
    def top
      
    end
    
    def about
    end
    
    def index
      @items = Item.all
    end
    
    def show
      @item = Item.find(params[:id])
    end
end

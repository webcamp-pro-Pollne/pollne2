class OrdersController < ApplicationController
  def new
@order = Order.new
  end
    
  def index
    @orders = Order.all
  end
  
  def show
  end
  
  def confirm
  end
  
  def done
  end
  
  def create
  end
end

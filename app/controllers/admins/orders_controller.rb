class Admins::OrdersController < ApplicationController
  
  def top
    @orders = Order.all
  end
  
  def show
  end
  
  def update
  end
  
end

class Admins::OrdersController < ApplicationController
  
  before_action :autheniticate_admin

  def top
    @orders = Order.all
  end

  def show
  end

  def update
  end

end

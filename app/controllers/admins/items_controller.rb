class Admins::ItemsController < ApplicationController

  def index
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end
  
  private

  def items_params
    params.require(:item).permit(:name)
  end
end

class AddressesController < ApplicationController
    
  def index
  end
    
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
    def address_params
      params.require(:address).permit(:name, :postal_code, :address)
    end
end

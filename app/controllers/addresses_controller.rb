class AddressesController < ApplicationController
  before_action :authenticate_customer!
  

  def index
    
    @addresses = current_customer.addresses.all
    @address = current_customer.addresses.new

  end

  def create
      @address = current_customer.addresses.new(address_params)
	    @address.save
	        redirect_to  request.referer

  end


  def edit
    @addresses = current_customer.addresses.find(params[:id])
  end

  def update
    @addresses = current_customer.addresses.find(params[:id])
    if @addresses.update(address_params)
      redirect_to addresses_path
    else
      render "edit"
    end
  end

  def destroy
     @address = current_customer.addresses.find(params[:id])
     @address.destroy
     redirect_to addresses_path

  end

  private

    def address_params
      params.require(:address).permit(:name, :postal_code, :address, :customer_id)
    end

end

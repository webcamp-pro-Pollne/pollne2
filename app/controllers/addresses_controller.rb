class AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
      @address = Address.new(address_params)
	    @address.customer_id = current_customer.id
	    @address.save
	        redirect_to  request.referer

  end


  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    if @addresses.update(address_params)
      redirect_to addresses_path
    else
      render "edit"
    end
  end

  def destroy
     @address = Address.find(params[:id])
     @address.destroy
     redirect_to addresses_path

  end

  private

    def address_params
      params.require(:address).permit(:name, :postal_code, :address, :customer_id)
    end

end

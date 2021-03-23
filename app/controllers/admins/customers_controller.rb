class Admins::CustomersController < ApplicationController
   before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page]).per(2)
  end
  
  def show
    @customer  = Customer.find(params[:id])
  end
  
  def edit
     @customer  = Customer.find(params[:id])
  end
  
  
  def update
    @customer  = Customer.find(params[:id])
    if @customer.update(cutomer_params)
       redirect_to adimis_customer_path(@customer), motice: "顧客情報を変更しました"
    else
      render :edit
    end
  end
  


 private
  
  def cutomer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :adress, :telephone_number, :email, :is_deleted)
  end
 
end

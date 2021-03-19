class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
    
  def after_sign_in_path_for(resource)
      root_path
  end
  
  def after_sign_out_path_for(resource)
      root_path
  end
  
  protected
  
   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
   end
   
   def current_cart
     current_cart = Cart.find_by(id: session[:cart_id])
     current_cart = Cart.create unless current_cart
     session[:cart_id] = current_cart.id
     current_cart
   end
end
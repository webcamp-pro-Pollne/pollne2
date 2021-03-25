class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  
  def autheniticate_admin
    if current_admin == nil
      redirect_to new_admin_session_path
    end
  end
  
  def autheniticate_customer
    if current_customer == nil
      redirect_to new_customer_session_path
    end
  end

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

#   def current_cart
    #  current_cart = Cart.find_by(id: session[:cart_id])
    #  current_cart = Cart.create unless current_cart
    #  session[:cart_id] = current_cart.id
    #  current_cart
#   end

#   def current_cart_items
    #   if session[:cart_item_id]
        # @cart_item = CartItem.find(session[:cart_item_id])
    #   else
        # @cart_item = CartItem.create
        # session[:cart_item_id] = @cart_item.id
    #   end
#   end

end
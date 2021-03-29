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


  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     admins_path
  #   when Customer
  #     root_path
  #   end
  # end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
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
   def orders_details_auto_status_changer(order)
      if order.read_attribute_before_type_cast(:status) == 1#orderのstatusカラムに１が入ったら
        order.orders_details.each do |order_detail|#orders_detailsをeachで回し、
          order_detail.update(making_status: 1)#回して出た分のmaking_statusを１にupdateする
        end
      end
   end

    def order_auto_status_changer(order)#（制作ステータスを切り替えると注文ステータスが切り替わる関数。）if文の関数は以下に定義
      if  making_now(order)
        order.update(status: 2)

      elsif making_perfect_all(order)
        order.update(status: 3)
      end
    end

    def making_now(order)
      order.orders_details.each do |order_detail|
        #puts order_detail.read_attribute_before_type_cast(:making_status)
        if order_detail.read_attribute_before_type_cast(:making_status) == 2#1つでも数値の２が入ってらtrueを返す。
          return true
          #returnは条件になるまで処理を継続する。
        end
      end
      return false
    end

    def making_perfect_all(order)
      order.orders_details.each do |order_detail|
         unless order_detail.read_attribute_before_type_cast(:making_status) == 3
           return false
         end
      end
      return true#すべてのmaking_statusに３が入ったら、trueをかえす
    end

end
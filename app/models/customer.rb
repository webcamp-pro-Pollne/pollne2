class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders

    def total_price#current_customer(←selfにあたる)を引き出して使うため、ここでカートアイテムの計算を行っている。self勉強しておく
    #cart_item内の合計金額をループさせて算出
    sum = 0
    self.cart_items.each do |cart_item|
      sum += (cart_item.item.price * cart_item.amount * 1.08).floor
    end
    sum.floor
    #<%= CartItem.sum_tax(@sum) %>
    #↑インスタンス変数にモデルで定義した関数は使えないので使うならこのように引数として用いる


    #current_customer.cart_items.sum(:price)
    #Order.all.sum(:price)
    end

    def full_name
    last_name + first_name
    end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end

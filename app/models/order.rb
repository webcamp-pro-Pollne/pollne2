class Order < ApplicationRecord
  has_many :orders_details
  belongs_to :customer

  enum payment_method: [:クレジットカード, :銀行振込]
  enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]

  def tannka
    (item.price * 1.08).floor
  end

  def syoukei
    (item.price * current_customer.cart_item.amount * 1.08).floor
  end



end

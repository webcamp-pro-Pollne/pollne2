class Order < ApplicationRecord
  has_many :ordersdetails
  belongs_to :customer

  enum payment_method: [:クレジットカード, :銀行振込]
  enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]

  def tannka
    price * 1.08
  end

  def syoukei
    item.price * quantity * 1.08
  end

  def total_price
    Order.all.sum(:price)
  end

end

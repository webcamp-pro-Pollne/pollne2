class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

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

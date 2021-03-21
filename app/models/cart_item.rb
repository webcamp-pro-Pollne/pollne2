class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def tannka
    price * 1.08
  end

  def syoukei
    (item.price * amount * 1.08).floor
  end

  def total_price#今回は使ってない
    CartItem.all.sum(:price)
  end

  def self.sum_tax(sum)
    (sum * 1.08).floor.to_s(:delimited)
  end


end

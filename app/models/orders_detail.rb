class OrdersDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: [:着手不可, :製作待ち, :製作中, :製作完了]

  def tannka
    (self.price * 1.08).floor
  end

  def syoukei
    (self.item.price * self.amount * 1.08).floor.to_s(:delimited)
  end


end

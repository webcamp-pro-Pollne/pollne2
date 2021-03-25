class Item < ApplicationRecord

    has_many :cart_items
    has_many :orders_details

    # belongs_to :customer
    belongs_to :genre

    attachment :image

    def tax_price
      (price * 1.08).floor.to_s(:delimited)
    end



end


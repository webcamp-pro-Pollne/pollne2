class Item < ApplicationRecord

    has_many :cart_items
    has_many :orders_details

    # belongs_to :customer
    has_many :genres

    attachment :image

    def tax_price
      (price * 1.08).floor.to_s(:delimited)
    end



end


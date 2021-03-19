class Item < ApplicationRecord
    # belongs_to :customer
    has_many :genres

    attachment :image

    def tax_price
      (price * 1.08).floor
    end

end
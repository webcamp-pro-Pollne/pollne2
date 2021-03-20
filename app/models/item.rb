class Item < ApplicationRecord
    belongs_to :customer
    has_many :orders_details
    attachment :image

    def tex_price
      price * 1.08
    end

end

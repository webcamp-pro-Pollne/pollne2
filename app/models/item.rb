class Item < ApplicationRecord
    has_many :cart_items
    belongs_to :customer

    attachment :image

    def tex_price
      price * 1.08
    end

end

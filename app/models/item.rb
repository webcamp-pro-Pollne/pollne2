class Item < ApplicationRecord
    belongs_to :customer
    
    attachment :image
end

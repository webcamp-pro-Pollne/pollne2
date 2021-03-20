class OrdersDetail < ApplicationRecord

    belongs_to :item
    belongs_to :order

  enum making_status: [:着手不可, :作成待ち, :作成中, :作成完了 ]
end

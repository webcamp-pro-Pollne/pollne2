class AddOrderIdItemIdToOrdersDetails < ActiveRecord::Migration[5.2]
  def change
     add_reference :orders_details, :order_id, foreign_key: true
     add_reference :orders_details, :item_id, foreign_key: true
  def change
     change_column :orders_details, :order_id, :reference, null: false
     change_column :orders_details, :item_id, :reference, null: false
  end
  end
end

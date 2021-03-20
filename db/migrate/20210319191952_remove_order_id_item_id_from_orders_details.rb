class RemoveOrderIdItemIdFromOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders_details, :order_id, :integer
    remove_column :orders_details, :item_id, :integer
  end
end

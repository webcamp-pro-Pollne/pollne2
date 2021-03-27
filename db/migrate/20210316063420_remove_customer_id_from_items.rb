class RemoveCustomerIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :customer_id, :integer
  end
end

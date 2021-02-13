class AddOwnerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :owner_id, :bigint
  end
end

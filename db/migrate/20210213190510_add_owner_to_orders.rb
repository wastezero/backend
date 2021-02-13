class AddOwnerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :owner, :integer
  end
end

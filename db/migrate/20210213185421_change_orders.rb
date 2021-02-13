class ChangeOrders < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :orders, :clients, column: :owner_id
  end
end

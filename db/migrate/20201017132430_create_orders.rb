class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :branch, index: true, foreign_key: { to_table: :branches }
      t.references :food, index: true, foreign_key: { to_table: :foods }
      t.references :client, index: true, foreign_key: { to_table: :clients }
      t.datetime :expiration_time
      t.datetime :overdue_date
      t.float :discount_price
      t.timestamps
    end
  end
end

class AddRestaurantIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :restaurant_id, :integer
  end
end

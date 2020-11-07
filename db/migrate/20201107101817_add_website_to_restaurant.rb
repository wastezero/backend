class AddWebsiteToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :website, :string
  end
end

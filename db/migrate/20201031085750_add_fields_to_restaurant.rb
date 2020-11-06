class AddFieldsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :status, :string
    add_column :restaurants, :avatar, :string
    add_column :restaurants, :description, :string
    add_column :restaurants, :contacts, :string
  end
end

class AddLatToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :lat, :bigint
  end
end

class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :lng, :float
    change_column :addresses, :lat, :float
  end
end

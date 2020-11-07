class FixAddressesColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :long, :lng
  end
end

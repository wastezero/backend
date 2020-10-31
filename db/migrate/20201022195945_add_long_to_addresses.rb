class AddLongToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :long, :bigint
  end
end

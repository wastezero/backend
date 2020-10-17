class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :house_number
      t.string :zip_code

      t.timestamps

      add_foreign_key :addresses, :cities
      add_foreign_key :addresses, :countries
    end
  end
end

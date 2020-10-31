class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :house_number
      t.string :zip_code

      t.references :city, index: true, foreign_key: { to_table: :cities }
      t.references :country, index: true, foreign_key: { to_table: :countries }
      t.timestamps
    end
  end
end

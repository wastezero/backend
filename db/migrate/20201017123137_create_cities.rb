class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :country, index: true, foreign_key: { to_table: :countries }

      t.timestamps
    end
  end
end

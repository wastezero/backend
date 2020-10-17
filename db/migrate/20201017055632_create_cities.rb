class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name

      t.timestamps

      add_foreign_key :cities, :countries
    end
  end
end

class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.string :ingredients
      t.float  :price
      t.string :cuisine
      t.string :type
      t.references :restaurant, index: true, foreign_key: { to_table: :restaurants }

      t.timestamps
    end
  end
end

class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.references :branch, index: true, foreign_key: { to_table: :branches }

      t.timestamps
    end
  end
end

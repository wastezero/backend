class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|

      t.references :restaurant, index: true, foreign_key: { to_table: :restaurants }
      t.references :address, index: true, foreign_key: { to_table: :addresses }
      t.timestamps
    end
  end
end

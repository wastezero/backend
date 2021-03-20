class CreateHacknuUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_users do |t|
      t.string :name
      t.string :lastname
      t.integer :age
      t.float :lat
      t.float :lng
      t.string :gender
      t.string :city

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email, unique: true
      t.string :password
      t.references :address, index: true, foreign_key: { to_table: :addresses }

    end
  end
end

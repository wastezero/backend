class CreateHacknuImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_images do |t|
      t.string :name
      t.string :url

      t.references :user, index: true, foreign_key: { to_table: :hacknu_users }

      t.timestamps
    end
  end
end

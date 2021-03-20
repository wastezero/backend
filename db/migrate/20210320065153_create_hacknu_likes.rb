class CreateHacknuLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_likes do |t|

      t.references :fan, index: true, foreign_key: { to_table: :hacknu_users }
      t.references :crush, index: true, foreign_key: { to_table: :hacknu_users }

      t.string :fan_like_type
      t.string :crush_like_type
      t.boolean :matched

      t.timestamps
    end
  end
end

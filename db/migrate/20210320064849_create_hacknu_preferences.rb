class CreateHacknuPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_preferences do |t|
      t.integer :min_age
      t.integer :max_age
      t.integer :distance

      t.references :user, index: true, foreign_key: { to_table: :hacknu_users }

      t.timestamps
    end
  end
end

class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :manager, index: true, foreign_key: { to_table: :users }
      t.references :client, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end

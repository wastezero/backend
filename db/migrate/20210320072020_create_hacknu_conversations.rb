class CreateHacknuConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_conversations do |t|

      t.references :user1, index: true, foreign_key: { to_table: :hacknu_users }
      t.references :user2, index: true, foreign_key: { to_table: :hacknu_users }
      t.references :topic_room, index: true, foreign_key: { to_table: :hacknu_topic_rooms }
      t.boolean :open

      t.timestamps
    end
  end
end

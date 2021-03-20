class CreateHacknuTopicRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_topic_rooms do |t|

      t.references :topic, index: true, foreign_key: { to_table: :hacknu_topics }
      t.references :user, index: true, foreign_key: { to_table: :hacknu_users }
      t.boolean :free

      t.timestamps
    end
  end
end

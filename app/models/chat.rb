class Chat < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  belongs_to :client, class_name: 'User'
  has_many :messages

  def last_message
    Message.where(chat_id: id)&.last
  end
end

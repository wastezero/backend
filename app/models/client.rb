class Client < ApplicationRecord
  belongs_to :address, optional: true
  has_one :user

  def chats
    Chat.where(client_id: user.id)
  end
end

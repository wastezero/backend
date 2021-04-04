class Manager < ApplicationRecord
  after_initialize :init
  belongs_to :branch, foreign_key: :branch_id
  has_one :user

  scope :of_restaurant, ->(restaurant_id) {
    joins(:branch).
      where(branches: {restaurant_id: restaurant_id})
  }

  def init
    self.status ||= :new
  end

  def chats
    Chat.where(manager_id: user.id)
  end
end

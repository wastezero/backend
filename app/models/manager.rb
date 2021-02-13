class Manager < ApplicationRecord
  after_initialize :init
  belongs_to :branch, foreign_key: :branch_id

  scope :of_restaurant, ->(restaurant_id) {
    joins(:branch).
      where(branches: {restaurant_id: restaurant_id})
  }

  def init
    self.status ||= :new
  end
end

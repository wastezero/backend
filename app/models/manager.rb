class Manager < ApplicationRecord
  after_initialize :init
  belongs_to :branch, foreign_key: :branch_id

  def init
    self.status ||= :pending
  end
end

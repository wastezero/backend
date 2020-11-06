class Manager < ApplicationRecord
  after_initialize :init

  def init
    self.status ||= :pending
  end
end

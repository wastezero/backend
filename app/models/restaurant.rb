class Restaurant < ApplicationRecord
  after_initialize :init

  has_many :branches
  has_many :foods

  def init
    self.status ||= :confirmed
  end

end

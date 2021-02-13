class Food < ApplicationRecord
  has_many :orders

  belongs_to :restaurant, optional: true
end

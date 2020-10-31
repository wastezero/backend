class Branch < ApplicationRecord
  has_many :orders
  belongs_to :restaurant, foreign_key: :restaurant_id
  belongs_to :address, foreign_key: :address_id
end

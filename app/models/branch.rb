class Branch < ApplicationRecord
  has_many :orders
  has_one :manager

  belongs_to :restaurant, foreign_key: :restaurant_id
  belongs_to :address, foreign_key: :address_id

  scope :filter_by_price, ->(min_price, max_price) { joins(:order).where("orders.discount_price >= ? AND orders.discount_price <= ?", min_price, max_price) }
  scope :filter_by_cuisine, ->(cuisines) { joins(:restaurant => :foods).where("foods.cuisine IN (?)", cuisines) }
  scope :filter_by_search_name, ->(name) { joins(:restaurant).where("restaurants.name like ?", name) }

  scope :of_restaurant, ->(restaurant_id) {
    where(restaurant_id: restaurant_id)
  }
end

class Branch < ApplicationRecord
  has_many :orders

  belongs_to :restaurant, foreign_key: :restaurant_id
  belongs_to :address, foreign_key: :address_id

  scope :filter_by_price, -> (min_price, max_price) { joins(:order).where("orders.discount_price >= ? AND orders.discount_price <= ?", min_price, max_price) }
  scope :filter_by_types, -> (type_ids) { joins(:restaurant => :foods).where("foods.type IN (?)", type_ids) }
  scope :filter_by_search_name, -> (name) { joins(:restaurant).where("restaurants.name like ?", name) }
end

class Order < ActiveRecord::Base
  belongs_to :branch
  belongs_to :food

  @max_lat_dist = 100
  @max_lng_dist = 100

  #TODO lng & lat filter

  scope :filter_by_price, -> (min_price, max_price) { where("discount_price >= ? AND discount_price <= ?", min_price, max_price) }
  scope :filter_by_distance, -> (lng, lat) {
    joins(branch: [:address])
        .where("addresses.lng >= ? AND addresses.lat >= ?", lng, lat)}
  scope :filter_by_types, ->(type_ids) { joins(:food).where(food: { type: type_ids })}


end

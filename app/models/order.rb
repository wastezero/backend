class Order < ActiveRecord::Base
  belongs_to :branch
  belongs_to :food


  #TODO lng & lat filter

  scope :filter_by_price, -> (min_price, max_price) { where("discount_price >= ? AND discount_price <= ?", min_price, max_price) }
  scope :filter_by_types, -> (type_ids) { joins(:food).where("foods.type IN (?)", type_ids) }
  # scope :filter_by_distance, -> (lng, lat) {
  #   joins(branch: [:address]).where("addresses.lng >= ? AND addresses.lng <= ? AND addresses.lat >= ? AND addresses.lat <= ?",
  #                                   getNearestLocations(lng, lat)[0], getNearestLocations(lng, lat)[1],
  #                                   getNearestLocations(lng, lat)[2], getNearestLocations(lng, lat)[3]) }



end

class Order < ActiveRecord::Base
  belongs_to :branch
  belongs_to :food

  after_initialize :set_defaults

  def set_defaults
    self.status ||= 'CREATED'
  end


  scope :filter_by_price, -> (min_price, max_price) { where("discount_price >= ? AND discount_price <= ?", min_price, max_price) }
  scope :filter_by_types, -> (type_ids) { joins(:food).where("foods.type IN (?)", type_ids) }
  scope :filter_by_distance, -> (minLng, maxLng, minLat, maxLat) {
    joins(branch: [:address])
        .where("addresses.lng >= ? AND addresses.lng <= ? AND addresses.lat >= ? AND addresses.lat <= ?",
               minLng, maxLng, minLat, maxLat) }
  scope :filter_by_search_name, -> (name) { joins(:food).where("foods.name like ?", name) }
  scope :filter_by_search_rest, -> (name) { joins(:branch => :restaurant).where("restaurants.name like ?", name) }

end

class Order < ActiveRecord::Base
  enum owner: [:restaurant, :client]

  belongs_to :branch, optional: true
  belongs_to :food
  belongs_to :client, foreign_key: 'owner_id', optional: true

  after_initialize :set_defaults

  def set_defaults
    self.status ||= 'CREATED'
  end


  scope :filter_by_price, -> (min_price, max_price) { where("discount_price >= ? AND discount_price <= ?", min_price, max_price) }
  scope :filter_by_cuisine, -> (cuisines) { joins(:food).where("foods.cuisine IN (?)", cuisines) }
  scope :filter_by_distance, -> (minLng, maxLng, minLat, maxLat) {
    joins(branch: [:address])
        .where("addresses.lng >= ? AND addresses.lng <= ? AND addresses.lat >= ? AND addresses.lat <= ?",
               minLng, maxLng, minLat, maxLat) }
  scope :filter_by_search_name, -> (name) { joins(:food).where("foods.name like ?", name) }
  scope :filter_by_search_rest, -> (name) { joins(:branch => :restaurant).where("restaurants.name like ?", name) }

  def as_json(options={})
    super(options).reject { |k, v| v.nil? }
  end
end

class Address < ApplicationRecord
  belongs_to :city, foreign_key: :city_id

  def city_name
    city.name
  end

  def country_name
    city.country.name
  end
end

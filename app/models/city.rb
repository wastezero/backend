class City < ApplicationRecord
  belongs_to :country, foreign_key: :country_id
end

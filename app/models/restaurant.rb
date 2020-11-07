class Restaurant < ApplicationRecord
  has_many :branches
  has_many :foods
end

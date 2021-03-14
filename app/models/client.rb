class Client < ApplicationRecord
  belongs_to :address, optional: true
end

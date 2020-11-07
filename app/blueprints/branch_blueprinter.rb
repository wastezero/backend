# frozen_string_literal: true

class BranchBlueprinter < Blueprinter::Base
  identifier :id

  view :overview do
    association :restaurant, blueprint: RestaurantBlueprinter
    association :address, blueprint: AddressBlueprinter
  end

end

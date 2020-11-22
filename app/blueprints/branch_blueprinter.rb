# frozen_string_literal: true

class BranchBlueprinter < Blueprinter::Base
  identifier :id

  view :client_orders do
    exclude :id
    association :restaurant, blueprint: RestaurantBlueprinter, view: :client_orders
    association :address, blueprint: AddressBlueprinter, view: :client_orders
  end

  view :client_branches do
    association :restaurant, blueprint: RestaurantBlueprinter, view: :client_branches
    association :address, blueprint: AddressBlueprinter, view: :client_branches
  end

  view :client_branch do
    association :restaurant, blueprint: RestaurantBlueprinter, view: :client_branch
    association :address, blueprint: AddressBlueprinter, view: :client_branch
  end

  view :overview do
    association :restaurant, blueprint: RestaurantBlueprinter, view: :extended
    association :address, blueprint: AddressBlueprinter, view: :extended
  end

end

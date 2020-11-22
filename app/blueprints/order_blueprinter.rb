# frozen_string_literal: true

class OrderBlueprinter < Blueprinter::Base
  identifier :id

  field :discount_price, name: :price
  field :expires_at

  view :client_orders do
      association :food, blueprint: FoodBlueprinter, view: :client_orders
      association :branch, blueprint: BranchBlueprinter, view: :client_orders
  end

  view :client_my_orders do
    fields :deadline
    association :food, blueprint: FoodBlueprinter, view: :client_orders
    association :branch, blueprint: BranchBlueprinter, view: :client_orders
  end

end
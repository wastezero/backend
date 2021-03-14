# frozen_string_literal: true

class OrderBlueprinter < Blueprinter::Base
  identifier :id

  field :discount_price, name: :price
  field :expires_at
  field :owner_id

  view :client_orders do
    association :food, blueprint: FoodBlueprinter
    association :branch, blueprint: BranchBlueprinter, view: :client_orders
    association :client, blueprint: ClientBlueprinter
  end

  view :branch_orders do
    association :food, blueprint: FoodBlueprinter
  end

  view :client_my_orders do
    fields :deadline
    association :food, blueprint: FoodBlueprinter
    association :branch, blueprint: BranchBlueprinter, view: :client_orders
    association :client, blueprint: ClientBlueprinter
  end


end

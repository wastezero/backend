# frozen_string_literal: true

class FoodBlueprinter < Blueprinter::Base
  identifier :id

  fields :name, :cuisine, :image

  view :client_orders do
    exclude :id
  end

  view :branch_orders do
    include_view :client_orders
  end

  view :extended do
    fields :description, :ingredients
  end

end

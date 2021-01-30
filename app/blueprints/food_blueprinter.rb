# frozen_string_literal: true

class FoodBlueprinter < Blueprinter::Base
  identifier :id

  fields :name, :cuisine, :image

  view :client_orders do
  end

  view :extended do
    fields :description, :ingredients
  end

end

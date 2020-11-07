# frozen_string_literal: true

class RestaurantBlueprinter < Blueprinter::Base
  identifier :id

  fields :name, :cuisine, :status, :avatar, :description, :contacts, :website

end

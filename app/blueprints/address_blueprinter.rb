# frozen_string_literal: true

class AddressBlueprinter < Blueprinter::Base
  identifier :id

  fields :street, :house_number, :zip_code, :long, :lat, :city_name, :country_name

end

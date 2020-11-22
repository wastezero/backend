# frozen_string_literal: true

class AddressBlueprinter < Blueprinter::Base
  identifier :id

  fields :lng, :lat

  view :client_branches do
    exclude :id
  end

  view :client_branch do
    include_view :client_branches
    include_view :extended
  end

  view :client_orders do
    include_view :client_branches
    include_view :extended
    exclude :lng
    exclude :lat
  end

  view :extended do
    fields :street, :house_number, :zip_code, :city_name, :country_name
  end

end

# frozen_string_literal: true

class ClientBlueprinter < Blueprinter::Base
  identifier :id

  fields :address_id
#   association :address, blueprint: AddressBlueprinter
end

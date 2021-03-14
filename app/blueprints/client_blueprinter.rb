# frozen_string_literal: true

class ClientBlueprinter < Blueprinter::Base
  identifier :id
  association :address, blueprint: AddressBlueprinter
end

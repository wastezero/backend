# frozen_string_literal: true

class ManagerBlueprinter < Blueprinter::Base
  identifier :id

  fields :name, :surname, :phone, :branch_id, :status

end

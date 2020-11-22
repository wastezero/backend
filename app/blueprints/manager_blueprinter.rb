# frozen_string_literal: true

class ManagerBlueprinter < Blueprinter::Base
  identifier :id

  fields :name, :surname, :phone, :status
  association :branch, blueprint: BranchBlueprinter, view: :basic_info

end

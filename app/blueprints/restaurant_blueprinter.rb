# frozen_string_literal: true

class RestaurantBlueprinter < Blueprinter::Base
  identifier :id

  fields :name, :cuisine, :avatar

  view :client_branches do
    exclude :id
  end

  view :client_branch do
    include_view :client_branches
    fields :description, :contacts, :website
  end

  view :client_orders do
    include_view :client_branches
    exclude :cuisine
    exclude :avatar
  end

  view :admin_view do
    association :branches, blueprint: BranchBlueprinter, view: :main_info
    association :foods, blueprint: FoodBlueprinter
  end

  view :extended do
    fields :status, :description, :contacts, :website
  end

end

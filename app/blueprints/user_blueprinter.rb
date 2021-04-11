# frozen_string_literal: true

class UserBlueprinter < Blueprinter::Base
  field :id do |user|
    if user.restaurant_id.present?
      user.restaurant_id
    elsif user.manager_id.present?
      user.manager_id
    elsif user.admin_id.present?
      user.admin_id
    else
      user.client_id
    end
  end

  field :restaurant do |user|
    if user.restaurant_id.present?
      user.restaurant.name
    elsif user.manager_id.present?
      user.manager.branch.restaurant.name
    end
  end

  view :chat do
    exclude :authentication_token
    field :role
    field :name
  end

  fields :email, :authentication_token

  view :who_am_i do
    field :role
    field :name
  end

  # association :manager, blueprint: ManagerBueprinter
end

# frozen_string_literal: true

class UserBlueprinter < Blueprinter::Base
  field :id do |user|
    if user.restaurant_id.present?
      user.restaurant_id
    elsif user.manager_id.present?
      user.manager_id
    elsif user.admin_id.present?
      user.admin_id
    end
  end

  fields :email, :authentication_token

  view :who_am_i do
    field :role
    field :name
  end
end

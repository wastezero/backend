# frozen_string_literal: true

class UserBlueprinter < Blueprinter::Base
  identifier :id

  fields :email, :authentication_token

  view :who_am_i do
    field :role
    field :name
  end
end

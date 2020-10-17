# frozen_string_literal: true

class UserBlueprinter < Blueprinter::Base
  identifier :id

  fields :email

  view :authenticated do
    field :authentication_token
  end
end

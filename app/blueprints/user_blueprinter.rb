# frozen_string_literal: true

class UserBlueprinter < Blueprinter::Base
  identifier :id

  fields :email, :authentication_token
end

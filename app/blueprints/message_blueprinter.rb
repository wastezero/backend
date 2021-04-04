class MessageBlueprinter < Blueprinter::Base
  identifier :id

  fields :text

  association :sender, blueprint: UserBlueprinter, view: :chat
end
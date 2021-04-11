class MessageBlueprinter < Blueprinter::Base
  identifier :id

  field :text
  field :created_at, name: :sent_at

  association :sender, blueprint: UserBlueprinter, view: :chat
end
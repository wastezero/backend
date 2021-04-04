class ChatBlueprinter < Blueprinter::Base
  identifier :id

  association :user, blueprint: UserBlueprinter, view: :chat do |chat, options|
    if options[:user].manager?
      chat.client
    else
      chat.manager
    end
  end

  association :last_message, blueprint: MessageBlueprinter
end
class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{user_id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
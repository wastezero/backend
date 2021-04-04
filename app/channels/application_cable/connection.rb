module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :user_id

    def connect
      self.user_id = User.find_by(authentication_token: request.params[:token]).id
      reject_unauthorized_connection if self.user_id.nil?
    end
  end
end

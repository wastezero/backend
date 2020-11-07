class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def authenticate_user!
    head :unauthorized unless logged_in_user
  end

  def validate_admin!
    return head :unauthorized if @user.admin_id.nil?

    @admin = @user.admin
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token['user_id']
    @user = User.find_by(id: user_id)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    begin
      JsonWebToken.decode(token)
    rescue JWT::DecodeError
      nil
    end
  end

  def pagination_meta(object)        {
    current_page: object.current_page,
    next_page: object.next_page,
    prev_page: object.prev_page,
    total_pages: object.total_pages,
    total_count: object.total_count        }
  end


end

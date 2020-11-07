class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def authenticate_user!
    head :unauthorized unless logged_in_user
  end

  def validate!(roles)
    user_authorized = false
    roles.each do |role|
      user_authorized = public_send("validate_#{role}!")
      break if user_authorized
    end
    head :unauthorized unless user_authorized
  end

  def validate_admin!
    return false if @user.admin_id.nil?

    @admin = @user.admin
    true
  end

  def validate_restaurant!
    return false if @user.restaurant_id.nil?

    @restaurant = @user.restaurant
    true
  end

  def validate_client!
    return false if @user.client_id.nil?

    @client = @user.client
    true
  end

  def validate_manager!
    return false if @user.manager_id.nil?

    @manager = @user.manager
    true
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

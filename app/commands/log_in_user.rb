class LogInUser
  include Callable

  def initialize(user_params)
    @email = user_params[:email]
    @password = user_params[:password]
    set_user
  end

  def call
    return nil unless @user

    token = JsonWebToken.encode(user_id: @user.id)
    @user.authentication_token = token
    @user.save
    @user
  end

  private

  attr_accessor :email, :password

  def set_user
    user = User.find_by_email(email)

    @user = user if user&.authenticate(password)
  end
end
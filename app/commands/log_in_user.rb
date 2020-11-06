class LogInUser
  include Callable

  def initialize(user_params)
    @email = user_params[:email]
    @password = user_params[:password]
    set_user
  end

  def call
    token = JsonWebToken.encode(user_id: @user.id) if @user
    return nil unless token

    @user.authentication_token = token
    @user.save
    @user
  end

  private

  attr_accessor :email, :password

  def set_user
    @user = User.find_by_email(email)

    @user if @user&.authenticate(password)
  end
end
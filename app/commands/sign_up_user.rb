class SignUpUser
  include Callable

  def initialize(email, password)
    @email = email
    @password = password
    set_user
  end

  def call
    return nil unless @user

    token = @user ? JsonWebToken.encode(user_id: @user.id) : nil
    @user.authentication_token = token
    @user.save
    @user
  end

  private

  attr_accessor :email, :password

  def set_user
    existing_user = User.find_by_email(email)
    return nil if existing_user

    @user = User.create!(email: email, password: password)
  end
end

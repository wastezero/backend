# frozen_string_literal: true

class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  skip_before_action :verify_authenticity_token

  # sign in
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in 'user', @user
      puts @user.to_json
      render json: ::UserBlueprinter.render(@user, view: :authenticated), status: :ok
    else
      head :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:user).permit :email, :password
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    return @user if @user

    head :unprocessable_entity
  end
end

# frozen_string_literal: true

class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  skip_before_action :verify_authenticity_token, only: :create
  # sign up
  def create
    @user = User.new user_params
    if @user.save
      render json: ::UserBlueprinter.render(@user), status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?

    head :unprocessable_entity
  end
end

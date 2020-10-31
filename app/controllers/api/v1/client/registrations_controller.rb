# frozen_string_literal: true

class Api::V1::Client::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  skip_before_action :verify_authenticity_token, only: :create
  # sign up
  def create
    @client = Client.new client_params
    if @client.save
      render json: ::UserBlueprinter.render(@client), status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :surname, :phone, :email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:client].present?

    head :unprocessable_entity
  end
end

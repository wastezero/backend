# frozen_string_literal: true

class Api::V1::Client::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_client, only: :create
  skip_before_action :verify_authenticity_token

  # sign in
  def create
    if @client.valid_password?(sign_in_params[:password])
      sign_in 'client', @client
      puts @client.to_json
      render json: ::UserBlueprinter.render(@client, view: :authenticated), status: :ok
    else
      head :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:client).permit :email, :password
  end

  def load_client
    @client = Client.find_for_database_authentication(email: sign_in_params[:email])
    return @client if @client

    head :unprocessable_entity
  end
end

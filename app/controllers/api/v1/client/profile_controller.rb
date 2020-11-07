class Api::V1::Client::ProfileController < ApplicationController
  # before_action :set_client, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action -> { validate!(%w[client]) }

  # GET /clients/1
  def index
    render json: @profile
  end

  # PATCH/PUT /clients/1
  # def update
  #   if @client.update(client_params)
  #     render json: @client
  #   else
  #     render json: @client.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /clients/1
  # def destroy
  #   @client.destroy
  # end

  private
  # # Use callbacks to share common setup or constraints between actions.
  def set_client
    client_id = @client.id
    @profile = Client.find(client_id)
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:name, :surname, :phone, :email, :password)
  end
end

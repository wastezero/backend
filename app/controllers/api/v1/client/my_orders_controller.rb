class Api::V1::Client::MyOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action -> { validate!(%w[client]) }

  # GET /my_orders/
  def index
    @my_orders = Order.where(client_id: @client.id)
    render json: @my_orders
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
  # def set_client
  #   @profile = Client.find(@client.id)
  # end
end

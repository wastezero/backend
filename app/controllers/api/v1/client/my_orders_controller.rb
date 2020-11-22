class Api::V1::Client::MyOrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]
  before_action :authenticate_user!
  before_action -> { validate!(%w[client]) }

  # GET /my_orders/
  def index
    my_orders = Order.where(client_id: @client.id)

    @my_orders = my_orders.page(params[:page] ? params[:page].to_i : 1)
                  .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::OrderBlueprinter
                     .render(@my_orders, view: :client_orders, root: :orders, meta: pagination_meta(@my_orders))
  end

  # GET /my_orders/1
  def show
    render json: ::OrderBlueprinter.render(@my_order, view: :client_my_orders, root: :orders)
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
  #
  def set_order
    @my_order = Order.find(params[:id])
  end
  # def set_client
  #   @profile = Client.find(@client.id)
  # end
end

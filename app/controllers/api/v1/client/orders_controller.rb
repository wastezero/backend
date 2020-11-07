# require 'utils'

class Api::V1::Client::OrdersController < ApplicationController
  include Utils
  before_action :set_order, only: [:show]

  # GET /orders
  def index
    @square = square(params[:lng], params[:lat])
    @orders = Order.where(client_id: nil)
                   .where("expires_at >= ?", DateTime.now())
                   .all

    if params[:min_price].present? && params[:max_price].present?
      @orders = @orders.filter_by_price(params[:min_price], params[:max_price])
    end
    if params[:lng].present? && params[:lat].present?
      @orders = @orders.filter_by_distance(@square[0],@square[1],@square[2],@square[3])
    end
    if params[:type].present?
      @orders = @orders.filter_by_types(params[:type].split(','))
    end
    if params[:name].present?
      @orders = @orders.filter_by_search_name(params[:name])
    end
    if params[:restaurant].present?
      @orders = @orders.filter_by_search_rest(params[:restaurant])
    end

    render json: @orders
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  # # POST /orders
  # def create
  #   @order = Order.new(order_params)
  #
  #   if @order.save
  #     render json: @order, status: :created, location: @order
  #   else
  #     render json: @order.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  #
  # # DELETE /orders/1
  # def destroy
  #   @order.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # # Only allow a trusted parameter "white list" through.
    def order_params
      params.fetch(:order, {})
    end
end
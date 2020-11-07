# require 'utils'

class Api::V1::Client::OrdersController < ApplicationController
  include Utils
  before_action :set_order, only: [:show]

  # GET /orders
  def index
    @square = square(params[:lng], params[:lat])
    @orders = Order.filter_by_price(params[:min_price], params[:max_price])
                  .filter_by_distance(@square[0],@square[1],@square[2],@square[3])
                  .filter_by_types(params[:type])
                  .all

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
  # # PATCH/PUT /orders/1
  # def update
  #   if @order.update(order_params)
  #     render json: @order
  #   else
  #     render json: @order.errors, status: :unprocessable_entity
  #   end
  # end
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

  @rad = 1
  @R = 6371

  def getMinMaxLngLat(lng, lat)
    maxLat = lat + ((@rad / @R) * Math::PI / 180)
    minLat = lat - ((@rad / @R) * Math::PI / 180)
    maxLng = lng + (Math.asin(@rad / @R) / Math.cos(lat / 180 * Math::PI)) * Math::PI / 180
    minLng = lng - (Math.asin(@rad / @R) / Math.cos(lat / 180 * Math::PI)) * Math::PI / 180
    return minLat, maxLat
  end

    # # Only allow a trusted parameter "white list" through.
    # def order_params
    #   params.fetch(:order, {})
    # end
end

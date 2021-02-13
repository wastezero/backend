# require 'utils'

class Api::V1::Client::OrdersController < ApplicationController
  include Utils
  before_action :set_order, only: [:show, :update]
  before_action :authenticate_user!, only: [:update, :create]
  before_action -> { validate!(%w[client]) }, only: [:update, :create]

  # GET /orders
  def index
    square = square(params[:lng], params[:lat])
    orders = Order.where(client_id: nil)
                  .where("status = ?", "CREATED")
                  .where("expires_at >= ?", DateTime.now())
                  .all

    if params[:min_price].present? && params[:max_price].present?
      orders = orders.filter_by_price(params[:min_price], params[:max_price])
    end
    if params[:lng].present? && params[:lat].present?
      orders = orders.filter_by_distance(square[0],square[1],square[2],square[3])
    end
    if params[:type].present?
      orders = orders.filter_by_types(params[:type].split(','))
    end
    if params[:name].present?
      orders = orders.filter_by_search_name(params[:name])
    end
    if params[:restaurant].present?
      orders = orders.filter_by_search_rest(params[:restaurant])
    end
    if params[:branch_id].present?
      orders = orders.filter_by_branch(params[:restaurant])
    end

    if params[:sort_by].present?
      orders = orders.order(params[:sort_by])
    else
      orders = orders.order(updated_at: :desc)
    end


    @orders = orders.page(params[:page] ? params[:page].to_i : 1)
                    .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::OrderBlueprinter
                     .render(@orders, view: :client_orders, root: :orders, meta: pagination_meta(@orders))

  end

  # GET /orders/1
  def show
    render json: ::OrderBlueprinter.render(@order, view: :client_orders, root: :orders)
  end

  # # POST /orders
  def create
    @food = Food.new(food_params)
    @food.save
    @order = Order.new(order_params)
    @order.food_id = @food.id
    @order.owner_id = @client.id
    @order.owner = "client"

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    client_id = @client.id
    if @order.status == "CREATED" and @order.update(client_id: client_id, status: "BOOKED")
      render json: ::OrderBlueprinter.render(@order, view: :client_my_orders, root: :orders)
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
    params.require(:order).permit(:expires_at, :deadline,
                                  :discount_price)
  end

  def food_params
    params.require(:order)
          .permit(:name, :description,
                  :ingredients, :cuisine,
                  :price, :image)
  end
end

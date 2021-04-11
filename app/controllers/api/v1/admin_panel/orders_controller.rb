class Api::V1::AdminPanel::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action -> { validate!(%w[admin manager restaurant]) }, only: :create


  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.owner = "restaurant"

    @order.owner_id = @order.branch.manager.id

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  # # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:branch_id, :food_id,
                                  :expires_at, :deadline,
                                  :discount_price)
  end

end

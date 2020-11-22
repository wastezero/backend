class Api::V1::AdminPanel::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action -> { validate!(%w[admin]) }, only: :index

  # GET /restaurants
  def index
    @restaurants = Restaurant
                   .page(params[:page] ? params[:page].to_i : 1)
                   .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::RestaurantBlueprinter
      .render(@restaurants,
              view: :admin_view,
              root: :restaurants,
              meta: pagination_meta(@restaurants))
  end

  # GET /restaurants/1
  def show
    render json: ::RestaurantBlueprinter
      .render(@restaurant, view: :admin_view)
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: @restaurant, status: :created, location: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :cuisine)
    end
end

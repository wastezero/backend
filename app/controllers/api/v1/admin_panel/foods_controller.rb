class Api::V1::AdminPanel::FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action -> { validate!(%w[admin restaurant manager]) }, only: :create

  # GET /foods
  def index
    @foods = Food.page(params[:page] ? params[:page].to_i : 1)
                 .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::FoodBlueprinter.render(@foods,
                                          view: :extended,
                                          root: :foods,
                                          meta: pagination_meta(@foods)),
           status: 200
  end

  # GET /foods/1
  def show
    render json: ::FoodBlueprinter.render(@food, view: :extended)
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food, status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def food_params
    params.require(:food)
          .permit(:name, :description,
                  :ingredients, :price,
                  :cuisine, :restaurant_id,
                  :image)
  end
end

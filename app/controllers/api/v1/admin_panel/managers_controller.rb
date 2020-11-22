class Api::V1::AdminPanel::ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action -> { validate!(%w[admin restaurant]) }, only: :index

  # GET /managers
  def index
    managers = if @restaurant.present?
                 Manager.joins(:branch).includes(:branch)
                   .where(branch: { restaurant_id: @restaurant.id })
               else
                 Manager.includes(:branch).all
               end
    if params[:restaurant_id]
      managers = managers.of_restaurant(params[:restaurant_id])
    end


    @managers = managers.page(params[:page] ? params[:page].to_i : 1)
                        .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::ManagerBlueprinter
      .render(@managers, root: :managers, meta: pagination_meta(@managers))
  end

  # GET /managers/1
  def show
    render json: @manager
  end

  # POST /managers
  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      render json: @manager, status: :created, location: @manager
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /managers/1
  def update
    if @manager.update(manager_params)
      render json: @manager
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /managers/1
  def destroy
    @manager.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def manager_params
      params.require(:manager).permit(:name, :surname, :phone)
    end
end

class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :update, :destroy]

  # GET /managers
  def index
    @managers = Manager.all

    render json: @managers
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

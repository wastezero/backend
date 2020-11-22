class Api::V1::AdminPanel::BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action -> { validate!(%w[admin restaurant manager]) }, only: :index

  # GET /branches
  def index
    branches = if @restaurant.present?
                 Branch.includes(%i[restaurant address])
                       .where(restaurant_id: @restaurant.id)
               elsif @manager.present?
                 Branch.includes(%i[restaurant address])
                       .where(restaurant_id: @manager.branch.restaurant.id)
               else
                 Branch.includes(%i[restaurant address]).all
               end
    if params[:restaurant_id]
      branches = branches.of_restaurant(params[:restaurant_id])
    end

    @branches = branches.page(params[:page] ? params[:page].to_i : 1)
                        .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::BranchBlueprinter
      .render(@branches,
              view: :overview,
              root: :branches,
              meta: pagination_meta(@branches))
  end

  # GET /branches/1
  def show
    render json: ::BranchBlueprinter.render(@branch, view: :overview)
  end

  # POST /branches
  def create
    @branch = Branch.new(branch_params)

    if @branch.save
      render json: @branch, status: :created, location: @branch
    else
      render json: @branch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /branches/1
  def update
    if @branch.update(branch_params)
      render json: @branch
    else
      render json: @branch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /branches/1
  def destroy
    @branch.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def branch_params
      params.fetch(:branch, {})
    end
end

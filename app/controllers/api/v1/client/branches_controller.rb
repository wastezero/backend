class Api::V1::Client::BranchesController < ApplicationController
  # before_action :set_branch, only: [:show, :update, :destroy]

  # GET /branches
  def index
    max_price = 1000000
    min_price = 0
    branches = if params[:min_price].present? and params[:max_price].present?
                 Branch.filter_by_price(params[:min_price], params[:max_price])
               elsif params[:min_price].present?
                 Branch.filter_by_price(params[:min_price], max_price)
               elsif params[:max_price].present?
                 Branch.filter_by_price(min_price, params[:max_price])
               else
                 Branch.all
               end

    if params[:type].present?
      branches = branches.filter_by_cuisine(params[:type].split(','))
    end

    if params[:name].present?
      branches = branches.filter_by_search_name(params[:name])
    end

    @branches = branches.page(params[:page] ? params[:page].to_i : 1)
                    .per(params[:per_page] ? params[:per_page].to_i : 25)

    render json: ::BranchBlueprinter
                     .render(@branches, view: :client_branches, root: :branches, meta: pagination_meta(@branches))
  end

  # GET /branches/1
  def show
    @branch = Branch.joins(:orders).where("orders.branch_id = ?", params[:id]).first

    # render json: @branch
    render json: ::BranchBlueprinter.render(@branch, view: :client_branch, root: :branches)
  end

  # # POST /branches
  # def create
  #   @branch = Branch.new(branch_params)
  #
  #   if @branch.save
  #     render json: @branch, status: :created, location: @branch
  #   else
  #     render json: @branch.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /branches/1
  # def update
  #   if @branch.update(branch_params)
  #     render json: @branch
  #   else
  #     render json: @branch.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /branches/1
  # def destroy
  #   @branch.destroy
  # end

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

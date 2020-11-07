class Api::V1::Registration::BranchesController < ApplicationController

  def index
    @branches = Branch.all

    if params[:restaurant_id]
      @branches = @branches.where(restaurant_id: params[:restaurant_id])
    end

    @branches = @branches
                  .page(params[:page] ? params[:page].to_i : 1)
                  .per(params[:per_page] ? params[:per_page].to_i : 10000)


    render json: ::BranchBlueprinter
      .render(@branches, view: :overview, root: :branches, meta: pagination_meta(@branches))
  end
end

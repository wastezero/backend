class Api::V1::Registration::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all

    @restaurants = @restaurants
                    .page(params[:page] ? params[:page].to_i : 1)
                    .per(params[:per_page] ? params[:per_page].to_i : 10000)


    render json: ::RestaurantBlueprinter
      .render(@restaurants, view: :extended, root: :restaurants, meta: pagination_meta(@restaurants))
  end
end

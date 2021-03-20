class HacknuLikesController < ApplicationController
  before_action :set_hacknu_like, only: [:show, :update, :destroy]

  # GET /hacknu_likes
  def index
    @hacknu_likes = HacknuLike.all

    render json: @hacknu_likes
  end

  # GET /hacknu_likes/1
  def show
    render json: @hacknu_like
  end

  # POST /hacknu_likes
  def create
    @hacknu_like = HacknuLike.new(hacknu_like_params)

    if @hacknu_like.save
      render json: @hacknu_like, status: :created, location: @hacknu_like
    else
      render json: @hacknu_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_likes/1
  def update
    if @hacknu_like.update(hacknu_like_params)
      render json: @hacknu_like
    else
      render json: @hacknu_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_likes/1
  def destroy
    @hacknu_like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_like
      @hacknu_like = HacknuLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_like_params
      params.require(:hacknu_like).permit(:fan_id, :crush_id, :fan_like_type, :crush_like_type, :matched)
    end
end

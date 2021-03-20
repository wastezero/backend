class HacknuTagsController < ApplicationController
  before_action :set_hacknu_tag, only: [:show, :update, :destroy]

  # GET /hacknu_tags
  def index
    @hacknu_tags = HacknuTag.all

    render json: @hacknu_tags
  end

  # GET /hacknu_tags/1
  def show
    render json: @hacknu_tag
  end

  # POST /hacknu_tags
  def create
    @hacknu_tag = HacknuTag.new(hacknu_tag_params)

    if @hacknu_tag.save
      render json: @hacknu_tag, status: :created, location: @hacknu_tag
    else
      render json: @hacknu_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_tags/1
  def update
    if @hacknu_tag.update(hacknu_tag_params)
      render json: @hacknu_tag
    else
      render json: @hacknu_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_tags/1
  def destroy
    @hacknu_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_tag
      @hacknu_tag = HacknuTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_tag_params
      params.require(:hacknu_tag).permit(:name)
    end
end

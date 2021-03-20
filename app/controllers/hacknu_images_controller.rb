class HacknuImagesController < ApplicationController
  before_action :set_hacknu_image, only: [:show, :update, :destroy]

  # GET /hacknu_images
  def index
    @hacknu_images = HacknuImage.all

    render json: @hacknu_images
  end

  # GET /hacknu_images/1
  def show
    render json: @hacknu_image
  end

  # POST /hacknu_images
  def create
    @hacknu_image = HacknuImage.new(hacknu_image_params)

    if @hacknu_image.save
      render json: @hacknu_image, status: :created, location: @hacknu_image
    else
      render json: @hacknu_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_images/1
  def update
    if @hacknu_image.update(hacknu_image_params)
      render json: @hacknu_image
    else
      render json: @hacknu_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_images/1
  def destroy
    @hacknu_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_image
      @hacknu_image = HacknuImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_image_params
      params.require(:hacknu_image).permit(:name, :url)
    end
end

class HacknuPreferencesController < ApplicationController
  before_action :set_hacknu_preference, only: [:show, :update, :destroy]

  # GET /hacknu_preferences
  def index
    @hacknu_preferences = HacknuPreference.all

    render json: @hacknu_preferences
  end

  # GET /hacknu_preferences/1
  def show
    render json: @hacknu_preference
  end

  # POST /hacknu_preferences
  def create
    @hacknu_preference = HacknuPreference.new(hacknu_preference_params)

    if @hacknu_preference.save
      render json: @hacknu_preference, status: :created, location: @hacknu_preference
    else
      render json: @hacknu_preference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_preferences/1
  def update
    if @hacknu_preference.update(hacknu_preference_params)
      render json: @hacknu_preference
    else
      render json: @hacknu_preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_preferences/1
  def destroy
    @hacknu_preference.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_preference
      @hacknu_preference = HacknuPreference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_preference_params
      params.require(:hacknu_preference).permit(:min_age, :max_age, :distance)
    end
end

class HacknuUsersController < ApplicationController
  before_action :set_hacknu_user, only: [:show, :update, :destroy]

  # GET /hacknu_users
  def index
    @hacknu_users = HacknuUser.all

    render json: @hacknu_users
  end

  # GET /hacknu_users/1
  def show
    render json: @hacknu_user
  end

  # POST /hacknu_users
  def create
    @hacknu_user = HacknuUser.new(hacknu_user_params)

    if @hacknu_user.save
      render json: @hacknu_user, status: :created, location: @hacknu_user
    else
      render json: @hacknu_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_users/1
  def update
    if @hacknu_user.update(hacknu_user_params)
      render json: @hacknu_user
    else
      render json: @hacknu_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_users/1
  def destroy
    @hacknu_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_user
      @hacknu_user = HacknuUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_user_params
      params.require(:hacknu_user).permit(:name, :lastname, :age, :lat, :lng, :gender, :city)
    end
end

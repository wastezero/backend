class HacknuTopicRoomsController < ApplicationController
  before_action :set_hacknu_topic_room, only: [:show, :update, :destroy]

  # GET /hacknu_topic_rooms
  def index
    @hacknu_topic_rooms = HacknuTopicRoom.all

    render json: @hacknu_topic_rooms
  end

  # GET /hacknu_topic_rooms/1
  def show
    render json: @hacknu_topic_room
  end

  # POST /hacknu_topic_rooms
  def create
    @hacknu_topic_room = HacknuTopicRoom.new(hacknu_topic_room_params)

    if @hacknu_topic_room.save
      render json: @hacknu_topic_room, status: :created, location: @hacknu_topic_room
    else
      render json: @hacknu_topic_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_topic_rooms/1
  def update
    if @hacknu_topic_room.update(hacknu_topic_room_params)
      render json: @hacknu_topic_room
    else
      render json: @hacknu_topic_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_topic_rooms/1
  def destroy
    @hacknu_topic_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_topic_room
      @hacknu_topic_room = HacknuTopicRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_topic_room_params
      params.require(:hacknu_topic_room).permit(:free)
    end
end

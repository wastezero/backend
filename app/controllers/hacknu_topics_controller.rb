class HacknuTopicsController < ApplicationController
  before_action :set_hacknu_topic, only: [:show, :update, :destroy]

  # GET /hacknu_topics
  def index
    @hacknu_topics = HacknuTopic.all

    render json: @hacknu_topics
  end

  # GET /hacknu_topics/1
  def show
    render json: @hacknu_topic
  end

  # POST /hacknu_topics
  def create
    @hacknu_topic = HacknuTopic.new(hacknu_topic_params)

    if @hacknu_topic.save
      render json: @hacknu_topic, status: :created, location: @hacknu_topic
    else
      render json: @hacknu_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_topics/1
  def update
    if @hacknu_topic.update(hacknu_topic_params)
      render json: @hacknu_topic
    else
      render json: @hacknu_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_topics/1
  def destroy
    @hacknu_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_topic
      @hacknu_topic = HacknuTopic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_topic_params
      params.require(:hacknu_topic).permit(:name)
    end
end

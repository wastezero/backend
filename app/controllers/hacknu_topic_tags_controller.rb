class HacknuTopicTagsController < ApplicationController
  before_action :set_hacknu_topic_tag, only: [:show, :update, :destroy]

  # GET /hacknu_topic_tags
  def index
    @hacknu_topic_tags = HacknuTopicTag.all

    render json: @hacknu_topic_tags
  end

  # GET /hacknu_topic_tags/1
  def show
    render json: @hacknu_topic_tag
  end

  # POST /hacknu_topic_tags
  def create
    @hacknu_topic_tag = HacknuTopicTag.new(hacknu_topic_tag_params)

    if @hacknu_topic_tag.save
      render json: @hacknu_topic_tag, status: :created, location: @hacknu_topic_tag
    else
      render json: @hacknu_topic_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_topic_tags/1
  def update
    if @hacknu_topic_tag.update(hacknu_topic_tag_params)
      render json: @hacknu_topic_tag
    else
      render json: @hacknu_topic_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_topic_tags/1
  def destroy
    @hacknu_topic_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_topic_tag
      @hacknu_topic_tag = HacknuTopicTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_topic_tag_params
      params.require(:hacknu_topic_tag).permit(:topic_id, :tag_id)
    end
end

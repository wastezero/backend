class HacknuConversationsController < ApplicationController
  before_action :set_hacknu_conversation, only: [:show, :update, :destroy]

  # GET /hacknu_conversations
  def index
    @hacknu_conversations = HacknuConversation.all

    render json: @hacknu_conversations
  end

  # GET /hacknu_conversations/1
  def show
    render json: @hacknu_conversation
  end

  # POST /hacknu_conversations
  def create
    @hacknu_conversation = HacknuConversation.new(hacknu_conversation_params)

    if @hacknu_conversation.save
      render json: @hacknu_conversation, status: :created, location: @hacknu_conversation
    else
      render json: @hacknu_conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hacknu_conversations/1
  def update
    if @hacknu_conversation.update(hacknu_conversation_params)
      render json: @hacknu_conversation
    else
      render json: @hacknu_conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_conversations/1
  def destroy
    @hacknu_conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_conversation
      @hacknu_conversation = HacknuConversation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_conversation_params
      params.require(:hacknu_conversation).permit(:open)
    end
end

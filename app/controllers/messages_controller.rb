class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: %i[index create]
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = @chat.messages.order(created_at: :desc)

    render json: ::MessageBlueprinter.render(@messages, user: @user)
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      receiver = if @user.manager?
                   @chat.client
                 else
                   @chat.manager
                 end
      notify_user(receiver, @message, 'new_message')
      render json: ::MessageBlueprinter.render(@message)
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private

  def notify_user(user, message, action)
    ActionCable.server.broadcast(
      "message_channel_#{user.id}",
      message: {
        action: action,
        message: ::MessageBlueprinter.render(message).to_json
      }
    )
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
  # Use callbacks to share common setup or constraints between actions.

  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def message_params
    params[:sender_id] = @user.id
    params.permit(:chat_id, :sender_id, :text)
  end
end

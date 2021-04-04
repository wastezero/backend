class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /chats
  def index
    @chats = if @user.manager?
               Chat.where(manager_id: @user.id)
             else
               Chat.where(client_id: @user.id)
             end

    render json: ::ChatBlueprinter.render(@chats, user: @user)
  end

  # GET /chats/1
  def show
    render json: ::ChatBlueprinter.render(@chat, user: @user)
  end

  # POST /chats
  def create
    @chat = Chat.find_by(manager_id: chat_params[:manager_id], client_id: chat_params[:client_id])
    return render json: ::ChatBlueprinter.render(@chat, user: @user) if @chat.present?

    @chat = Chat.new(chat_params)

    if @chat.save
      notify_user(@receiver, @chat)
      render json: ::ChatBlueprinter.render(@chat, user: @user)
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def notify_user(user, chat)
    ActionCable.server.broadcast(
      "message_channel_#{user.id}",
      message: {
        action: 'new_channel',
        chat: ::ChatBlueprinter.render(chat, user: user).to_json
      }
    )
  end

  # Only allow a trusted parameter "white list" through.
  def chat_params
    params.permit(:user_id)
    if @user.manager?
      params[:manager_id] = @user.id
      @receiver = Client.find(params[:user_id]).user
      params[:client_id] = @receiver.id
    else
      params[:client_id] = @user.id
      @receiver = Manager.find(params[:user_id]).user
      params[:manager_id] = @receiver.id
    end
    params.permit(:manager_id, :client_id)
  end
end

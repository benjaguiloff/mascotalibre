# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    redirect_to conversation_messages_path(@conversation) if @message.save
  end

  def delete
    @message = @conversation.messages.find(params[:id])
    @message.destroy
    redirect_to conversations_path, notice: 'El mensaje ha sido eliminada'
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end

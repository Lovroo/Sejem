class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  def index
    @messages = @conversation.messages
    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    @message = @conversation.messages.new
  end
  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end
  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
  def authorize_user!
    @conversation = Conversation.find(params[:conversation_id])
    redirect_back fallback_location: root_path, alert: 'Nimate dostopa do teh sporočil.' unless current_user.id == @conversation.sender_id
  end
end
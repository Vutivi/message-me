class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message      = Message.new(message_params)
    @message.user = current_user
    if @message.save
      flash[:positive] = "Message succesfully sent!"
      redirect_to root_path
    else
      flash[:negative] = "Message could not be sent!"
    end
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end
end

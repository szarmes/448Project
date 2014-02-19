class MessagesController < ApplicationController

  def index
    @user = current_user
    @messages = Message.all
  end
  def create
    @message = Message.create!(params[:message])
  end

end
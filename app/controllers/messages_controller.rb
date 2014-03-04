class MessagesController < ApplicationController

  #rackup faye.ru -E production -s thin
  #execute the above line of code in terminal to start the FAYE server. This will add instant broadcasting
  #to all messages. Otherwise, they won't load unless the page is refreshed.

  def index
    @user = current_user
    @messages = Message.all
  end

  def create
    @user = current_user
    @message = Message.new(msg_params)
    @message.sent_at = Time.now
    @temp1 = @message.sender_id
    @temp2 = @message.receiver_id
    if @temp1<@temp2  #lesser id comes first in the chat path and channel path
      @id1 = @temp1
      @id2 = @temp2
    else
      @id1 = @temp2
      @id2 = @temp1
    end
    @channel = "/"+@id1.to_s+"chatwith"+ @id2.to_s   #putting the channel here somehow makes it visible in messages/create.js.erb (no clue why)
    respond_to do |format|
      if @message.save
          format.js
      end
    end
  end

  def privatechat
   	@user = current_user
   	if params[:id1]<params[:id2]		#the convention will be to have the lesser number come first in the path and the channel
    	@id1 = params[:id1].to_i
    	@id2 = params[:id2].to_i
    else
    	@id2 = params[:id1].to_i
    	@id1 = params[:id2].to_i
    end

    if @user.user_id==@id1
  		@other = User.find(@id2)
  		@requested = Friendship.where(sender_id: @user.user_id, receiver_id: @other.user_id, accepted: true)
    	@accepted = Friendship.where(sender_id: @other.user_id, receiver_id: @user.user_id, accepted: true)
    	if @accepted.empty? and @requested.empty? #make sure they are friends
    		redirect_to root_path
    	end 
    elsif @user.user_id==@id2
  		@other = User.find(@id1)
  		@requested = Friendship.where(sender_id: @user.user_id, receiver_id: @other.user_id, accepted: true)
    	@accepted = Friendship.where(sender_id: @other.user_id, receiver_id: @user.user_id, accepted: true)
    	if @accepted.empty? and @requested.empty? #make sure they are friends
    		redirect_to root_path
    	end
  	else 
  		redirect_to root_path
  	end
    @chatviewcheck = Chatview.find_by(id1: @id1, id2: @id2, viewer: @user.user_id)
    if !@chatviewcheck.nil?
      @chatviewcheck.destroy #so we only store the most recent view of the chat
    end
    @chatview = Chatview.create(id1: @id1, id2: @id2, viewer: @user.user_id, last_viewed_at: Time.now ) #store when they looked at the chat to get rid of new message notifications
    if !@other.nil? #make sure the other user exists
      @messages = Message.where(sender_id: @other.user_id, receiver_id: @user.user_id)
      @messages = @messages + Message.where(sender_id: @user.user_id, receiver_id: @other.user_id)
      @messages = @messages.sort_by { |obj| obj.sent_at } #loads all the past messages, ordered by date
    end

    @channel = "/"+@id1.to_s+"chatwith"+ @id2.to_s    #create the channel variable
  end


   private
    
    def msg_params
        params.require(:message).permit(:message, :sender_id, :receiver_id, :sent_at,:sender_name)
    end

end
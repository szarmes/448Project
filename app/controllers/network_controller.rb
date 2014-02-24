class NetworkController < ApplicationController

  def index

    @user = current_user
    @userID = current_user.user_id
    @requests = Friendship.where(receiver_id: @user.user_id, accepted: false)
    @requested = Friendship.where(sender_id: @user.user_id, accepted: true)
    @accepted = Friendship.where(receiver_id: @user.user_id, accepted: true)
    @friends= @requested+@accepted
    @online = Array.new
    @friends.each do |r|
      if r.receiver_id==@user.user_id
        @friend = User.find_by(user_id: r.sender_id)
         if @friend.last_seen_at > 5.minutes.ago
          @online.push(r)
        end
      else
        @friend = User.find_by(user_id: r.receiver_id)
         if @friend.last_seen_at > 5.minutes.ago
          @online.push(r)
        end
      end
    end
    @newmessages = Message.where(receiver_id: @user.user_id).group(:sender_id)
    @newmessages.each do |r|
      @lastviewed = "2013-02-23 19:49:25"
      @chatviews = Chatview.where(id1: r.sender_id, viewer: @user.user_id).order("last_viewed_at DESC") + Chatview.where(id2: r.sender_id, viewer: @user.user_id).order("last_viewed_at DESC")
      if !@chatviews.empty?
        @lastviewed =  @chatviews.first.last_viewed_at
      end
      @newmessages.delete_if {|s| s.sent_at < @lastviewed}
    end
  end

  def create

  end

  def show

  end

  def findfriend

    @user=current_user
    @results = User.findbyemail(params[:q])
    @q = params[:q]

  end

  def addfriend
    if user_signed_in?
      @sender = params[:sender]
      @receiver = params[:receiver]
      if Friendship.find_by(sender_id: @sender, receiver_id: @receiver).nil? &&
        Friendship.find_by(sender_id: @receiver, receiver_id: @sender).nil?

        @friend = Friendship.create(friendship_id: 0, sender_id: @sender, receiver_id: @receiver, sent_at: DateTime.now, accepted: false)

        if @friend.save

          flash[:success] = "Friend request sent"
          redirect_to root_path 
        else
          flash[:error] = "Oops, something went wrong."
          redirect_to root_path
        end

      else
        flash[:notice] = "Already friends with this person or friendship pending acceptance."
        redirect_to root_path
      end
    end
  end

  def accept

    if user_signed_in?
      @friendship = Friendship.find(params[:friend_id])
      @friendship.accepted = true
      @friendship.accepted_at = DateTime.now

      if @friendship.save
        flash[:success] = "Friend added"
        redirect_to network_path
      else
        flash[:error] = "Oops, something went wrong."
        redirect_to network_path
      end

    end

  end

  def decline
    fid = params[:friend_id]
    if user_signed_in?
      @friendship = Friendship.find_by(friendship_id: fid)
      @friendship.destroy
      flash[:success] = "Friendship avoided"
      redirect_to network_path
      
     
    end

  end

  def destroy

    @friendship = Friendship.find(params[:id])
    if user_signed_in? && (current_user.user_id == @friendship.sender_id || current_user.user_id== @friendship.receiver_id)
      @friendship.destroy
      flash[:success] = "Friendship destroyed."
    else
      flash[:error] = "No access"
    end
    redirect_to network_path

  end



 
end
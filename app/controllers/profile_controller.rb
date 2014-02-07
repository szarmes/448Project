class ProfileController < ApplicationController


  def index
   	@user = current_user
    @owner = User.find(params[:id])
    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @pp = 0
    else
      @experiences = Experience.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @skills = Skill.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @references = Reference.where(:user_id => @owner.user_id).paginate(page: params[:page])
    end
  end

  def show
      @user = current_user
    @owner = User.find(params[:id])

    @friendsadded = Friendship.where(sender_id: @owner.user_id, accepted: true)
    @friendsaccepted = Friendship.where(receiver_id: @owner.user_id, accepted: true)
    @friends = (@friendsaccepted + @friendsadded)
    
    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id).paginate(page: params[:page])
    else
      @experiences = Experience.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @skills = Skill.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @references = Reference.where(:user_id => @owner.user_id).paginate(page: params[:page])
    end
    reccomend()
  end

  def reccomend
    @user = current_user
    if @user.employer?
    else
      @userskills = Skill.where(user_id: @user.user_id)
      @postings = find_postings(@userskills)
      @postings = sort_postings(@postings)
    end
  end
  def find_postings(userskills)
    postings = Posting.where(posting_id: 0)
    p userskills
    userskills.each do |us|
      @label = us.label
      @jobskills = Skill.where(label: @label)
      @jobskills.each do |js|
        if !js.posting_id.nil?
          postings.push(Posting.find_by(posting_id: js.posting_id))
        end
      end
    end
    p postings
    return postings
  end

  def sort_postings(postings)
    @hash = {0 => 0}
    postings.each do |p|
      if @hash[p.posting_id].nil?
        @hash.merge!({p.posting_id => 1})
      else
        @hash[p.posting_id] = @hash[p.posting_id] + 1
      end
    end
    postings.clear
    @hash = Hash[@hash.sort_by{|k, v| v}.reverse]
    @hash.each_key do |key|
      postings.push(Posting.find_by(posting_id: key))
    end
    return postings
  end
end
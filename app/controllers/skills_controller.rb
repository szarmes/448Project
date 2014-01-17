class SkillsController < ApplicationController
  autocomplete :skilllabel, :label, :full => true

  def index
  	@skill = Skill.new
    @user = current_user
    @userID = current_user.user_id
    @skills = Skill.where(:user_id => current_user.user_id).paginate(page: params[:page])
  end

  def show

    @skill = Skill.find(params[:id])
    @user = current_user

  end

  def destroy
    @skill = Skill.find(params[:id])
    if (user_signed_in? && current_user.user_id == @skill.user_id)
      @skill.destroy
      flash[:success] = "Skill Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/skills'

  end

  def reccomend
    @user = current_user
    @userskills = Skill.where(user_id: @user.user_id)
    @postings = find_postings(@userskills)
    @postings = sort_postings(@postings)

    
    
  end

  def create
  	if(user_signed_in?)
  		@skill = Skill.new(skill_params)
      @skill.user_id = current_user.user_id
      if(Skilllabel.find_by(label: @skill.label).nil?)
        @skilllabel = Skilllabel.new
        @skilllabel.label = @skill.label
        @skilllabel.save
      end
  		if(@skill.save)
  			flash[:success] = "Skill created!"
      	redirect_to "/skills"
      else
  			flash[:error] = "Fill in all required fields"
       	redirect_to "/skills"
      end
      @skills = Skill.where(:user_id => current_user.user_id).paginate(page: params[:page])
      @userID = current_user.user_id
  	else
  		flash[:error] = "No access"
      redirect_to root_path
    end
  end

  private
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

    def skill_params
        params.require(:skill).permit(:label, :posting_id, :skill_id, :mandatory)
    end
end
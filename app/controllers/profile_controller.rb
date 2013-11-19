class ProfileController < ApplicationController


  def index
   	@user = current_user
    @owner = User.find(params[:id])
    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id).paginate(page: params[:page])
    else
      @experiences = Experience.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @skills = Skill.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @references = Reference.where(:user_id => @owner.user_id).paginate(page: params[:page])
    end
  end

  def show
      @user = current_user
    @owner = User.find(params[:id])
    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id).paginate(page: params[:page])
    else
      @experiences = Experience.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @skills = Skill.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @references = Reference.where(:user_id => @owner.user_id).paginate(page: params[:page])
    end
  end

 
end
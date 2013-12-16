class SkillsController < ApplicationController

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

  def update
    @skill = Skill.find(params[:id])
    if (user_signed_in? && current_user.user_id == @skill.user_id && !current_user.employer)
      if @skill.update_attributes(skill_params)
        @skill.save
        flash[:success] = "Changes saved"
        redirect_to '/skills'         
      else
        flash[:error] = "Changes not saved."
        redirect_to '/skills'                       
      end
    else
      flash[:error] = "No access"
      redirect_to '/skills'  
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    @user = current_user
  end

  def destroy
    @skill = Skill.find(params[:id])
    if (user_signed_in? && current_user.user_id == @skill.user_id && !current_user.employer)
      @skill.destroy
      flash[:success] = "Skill Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/skills'

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@skill = Skill.new(skill_params)
  		@skill.user_id = current_user.user_id
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
    
    def skill_params
        params.require(:skill).permit(:label, :description, :skill_id)
    end
end
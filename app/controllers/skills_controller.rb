class SkillsController < ApplicationController

  def index
  	@skill = Skill.new
  end

  def show

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@skill = Skill.new(skill_params)
  		@skill.user_id = current_user.user_id
  		if(@skill.save)
  			flash[:success] = "Skill created!"
        	redirect_to root_path
        else
  			flash[:error] = "Fill in all required fields"
        	redirect_to root_path
    end
  	else
  		flash[:error] = "No access"
        redirect_to root_path

  	end

  	
  end

  private
    
    def skill_params
        params.require(:skill).permit(:label, :desc, :skill_id)
    end
end
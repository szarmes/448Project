class ExperiencesController < ApplicationController

  def index
  	@experience = Experience.new
  end

  def show

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@experience = Experience.new(experience_params)
  		@experience.user_id = current_user.user_id
  		if(@experience.save)
  			flash[:success] = "Experience created!"
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
    
    def experience_params
        params.require(:experience).permit(:label, :desc, :experience_id)
    end
end
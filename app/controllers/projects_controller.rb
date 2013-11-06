class ProjectsController < ApplicationController

  def index
  	@project = Project.new
  end

  def show

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@project = Project.new(project_params)
  		@project.user_id = current_user.user_id
  		if(@project.save)
  			flash[:success] = "Project created!"
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
    
    def project_params
        params.require(:project).permit(:name, :desc)
    end
end
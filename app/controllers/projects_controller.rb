class ProjectsController < ApplicationController

  def index
  	@project = Project.new
    @user = current_user
    @expID = params[:expID]
  end

  def show

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@project = Project.new(project_params)
  		if(@project.save)
  			flash[:success] = "Project created!"
        redirect_to experiences_path
        else
  			flash[:error] = "Fill in all required fields"
        	redirect_to projects_path(:expID => params[:experience_id])
    end
  	else
  		flash[:error] = "No access"
        redirect_to root_path

  	end

  	
  end

  private
    
    def project_params
        params.require(:project).permit(:name, :desc, :experience_id, :project_id)
    end
end
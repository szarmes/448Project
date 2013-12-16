class ProjectsController < ApplicationController

  def index
  	@project = Project.new
    @user = current_user
    @expID = params[:expID]
  end

  def show

    @project = Project.find(params[:id])
    @user = current_user

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

  def update
    @project = Project.find(params[:id])
    @exp = Experience.find_by(experience_id: @project.experience_id )
    if (user_signed_in? && current_user.user_id == @exp.user_id && !current_user.employer)
      if @project.update_attributes(project_params)
        @project.save
        flash[:success] = "Changes saved"
        redirect_to '/projects'         
      else
        flash[:error] = "Changes not saved."
        redirect_to '/projects'                       
      end
    else
      flash[:error] = "No access"
      redirect_to '/projects'  
    end
  end

  def edit
    @project = Project.find(params[:id])
    @user = current_user
  end

  def destroy
    @project = Project.find(params[:id])
    @exp = Experience.find_by(experience_id: @project.experience_id )
    if (user_signed_in? && current_user.user_id == @exp.user_id && !current_user.employer)
      @project.destroy
      flash[:success] = "Project Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/projects'

  end

  private
    
    def project_params
        params.require(:project).permit(:name, :description, :experience_id, :project_id)
    end
end
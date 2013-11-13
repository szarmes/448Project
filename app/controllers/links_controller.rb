class LinksController < ApplicationController

  def index
  	@link = Link.new
    @user = current_user
    @projID = params[:projID]
  end

  def show

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@link = Link.new(link_params)
  		if(@link.save)
  			flash[:success] = "Link created!"
        redirect_to experiences_path
        else
  			flash[:error] = "Fill in all required fields"
        	redirect_to links_path(:projID => params[:project_id])
    end
  	else
  		flash[:error] = "No access"
        redirect_to root_path

  	end

  	
  end

  def update
    @link = Link.find(params[:id])
    @project = Project.find_by(project_id: @link.project_id)
    @exp = Experience.find_by(experience_id: @project.experience_id )
    if (user_signed_in? && current_user.user_id == @exp.user_id && !current_user.employer)
      if @link.update_attributes(link_params)
        @link.save
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
    @link = Link.find(params[:id])
    @user = current_user
  end

  def destroy
    @link = Link.find(params[:id])
    @project = Project.find_by(project_id: @link.project_id)
    @exp = Experience.find_by(experience_id: @project.experience_id )
    if (user_signed_in? && current_user.user_id == @exp.user_id && !current_user.employer)
      @link.destroy
      flash[:success] = "Link Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/projects'

  end

  private
    
    def link_params
        params.require(:link).permit(:url, :link_id, :project_id)
    end
end
class RequirementsController < ApplicationController

  def index
    @requirement = Requirement.new
    @user = current_user
    @expID = params[:expID]
  end

  def show

    @requirement = Requirement.find(params[:id])
    @user = current_user

  end

  def create

    if(user_signed_in? && current_user.employer)
      @requirement = Requirement.new(requirement_params)
      if(@requirement.save)
        flash[:success] = "Requirement created!"
        redirect_to postings_path
        else
        flash[:error] = "Fill in all required fields"
          redirect_to requirements_path(:expID => params[:posting_id])
    end
    else
      flash[:error] = "No access"
        redirect_to root_path

    end

    
  end

  def update
    @requirement = Requirement.find(params[:id])
    @exp = Posting.find_by(posting_id: @requirement.posting_id )
    if (user_signed_in? && current_user.user_id == @exp.user_id && current_user.employer)
      if @requirement.update_attributes(requirement_params)
        @requirement.save
        flash[:success] = "Changes saved"
        redirect_to '/requirements'         
      else
        flash[:error] = "Changes not saved."
        redirect_to '/requirements'                       
      end
    else
      flash[:error] = "No access"
      redirect_to '/requirements'  
    end
  end

  def edit
    @requirement = Requirement.find(params[:id])
    @user = current_user
  end

  def destroy
    @requirement = Requirement.find(params[:id])
    @exp = Posting.find_by(posting_id: @requirement.posting_id )
    if (user_signed_in? && current_user.user_id == @exp.user_id && current_user.employer)
      @requirement.destroy
      flash[:success] = "Requirement Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/requirements'

  end

  private
    
    def requirement_params
        params.require(:requirement).permit(:mandatory, :degree, :educationLvl, :description, :exp, :exp_area, :posting_id, :requirement_id)
    end
end
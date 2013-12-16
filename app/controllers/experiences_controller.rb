class ExperiencesController < ApplicationController

  def index
  	@experience = Experience.new
    @user = current_user
    @userID = current_user.user_id
    @experiences = Experience.where(:user_id => current_user.user_id).paginate(page: params[:page])
  end

  def show

    @experience = Experience.find(params[:id])
    @user = current_user

  end

  def update
    @experience = Experience.find(params[:id])
    if (user_signed_in? && current_user.user_id == @experience.user_id && !current_user.employer)
      if @experience.update_attributes(experience_params)
        @experience.save
        flash[:success] = "Changes saved"
        redirect_to '/experiences'         
      else
        flash[:error] = "Changes not saved."
        redirect_to '/experiences'                       
      end
    else
      flash[:error] = "No access"
      redirect_to '/experiences'  
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    @user = current_user
  end

  def destroy
    @experience = Experience.find(params[:id])
    if (user_signed_in? && current_user.user_id == @experience.user_id && !current_user.employer)
      @experience.destroy
      flash[:success] = "Skill Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/experiences'

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@experience = Experience.new(experience_params)
  		@experience.user_id = current_user.user_id
  		if(@experience.save)
  			flash[:success] = "Experience created!"
        	redirect_to '/experiences'
        else
  			flash[:error] = "Fill in all required fields"
        	redirect_to '/experiences'
    end
  	else
  		flash[:error] = "No access"
        redirect_to '/'

  	end

  	
  end

  private
    
    def experience_params
        params.require(:experience).permit(:title, :description, :experience_id, :sdate, :fdate, :company_name,
        :company_province, :company_address, :company_city, :company_country, :supervisor, :supervisor_phone)
    end
end
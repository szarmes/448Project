class ReferencesController < ApplicationController

  def index
  	@reference = Reference.new
    @user = current_user
    @userID = @user.user_id
    @references = Reference.where(:user_id => current_user.user_id).paginate(page: params[:page])
  end

  def show

  end

  def create

  	if(user_signed_in? && !current_user.employer)
  		@reference = Reference.new(reference_params)
  		@reference.user_id = current_user.user_id
  		if(@reference.save)
  			flash[:success] = "Reference created!"
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
  def update
    @reference = Reference.find(params[:id])
    if (user_signed_in? && current_user.user_id == @reference.user_id && !current_user.employer)
      if @reference.update_attributes(reference_params)
        @reference.save
        flash[:success] = "Changes saved"
        redirect_to '/references'         
      else
        flash[:error] = "Changes not saved."
        redirect_to '/references'                       
      end
    else
      flash[:error] = "No access"
      redirect_to '/references'  
    end
  end

  def edit
    @reference = Reference.find(params[:id])
    @user = current_user
  end

  def destroy
    @reference = Reference.find(params[:id])
    if (user_signed_in? && current_user.user_id == @reference.user_id && !current_user.employer)
      @reference.destroy
      flash[:success] = "Reference Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/references'

  end

  private
    
    def reference_params
        params.require(:reference).permit(:fname, :lname, :relationship, 
          :email, :phone_number, :yrsknown )
    end
end
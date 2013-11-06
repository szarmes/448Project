class ReferencesController < ApplicationController

  def index
  	@reference = Reference.new
    @user = current_user
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

  private
    
    def reference_params
        params.require(:reference).permit(:fname, :lname, :relationship, 
          :email, :phone_number, :yrsknown )
    end
end
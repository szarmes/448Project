class PostingsController < ApplicationController

  def index
  	@posting = Posting.new
  end

  def show

  end

  def create

  	if(user_signed_in? && current_user.employer)
  		@posting = Posting.new(posting_params)
  		@posting.user_id = current_user.user_id
  		if(@posting.save)
  			flash[:success] = "Posting created!"
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
    
    def posting_params
        params.require(:posting).permit(:title, :desc, :posting_id, :salary)
    end
end
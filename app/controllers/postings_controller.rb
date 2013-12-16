class PostingsController < ApplicationController

  def index
  	@posting = Posting.new
    @user = current_user
    @userID = @user.user_id
    @postings = Posting.where(:user_id => current_user.user_id).paginate(page: params[:page])
  end

  def show
    @posting = Posting.find(params[:id])
    @user = current_user

  end

  def create

  	if(user_signed_in? && current_user.employer)
  		@posting = Posting.new(posting_params)
  		@posting.user_id = current_user.user_id
  		if(@posting.save)
  			flash[:success] = "Posting created!"
        	redirect_to '/postings'
        else
  			flash[:error] = "Fill in all required fields"
        	redirect_to '/postings'
    end
  	else
  		flash[:error] = "No access"
        redirect_to root_path

  	end

  	
  end

  def update
    @posting = Posting.find(params[:id])
    if (user_signed_in? && current_user.user_id == @posting.user_id && current_user.employer)
      if @posting.update_attributes(posting_params)
        @posting.save
        flash[:success] = "Changes saved"
        redirect_to '/postings'         
      else
        flash[:error] = "Changes not saved."
        redirect_to '/postings'                       
      end
    else
      flash[:error] = "No access"
      redirect_to '/postings'  
    end
  end

  def edit
    @posting = Posting.find(params[:id])
    @user = current_user
  end

  def destroy
    @posting = Posting.find(params[:id])
    if (user_signed_in? && current_user.user_id == @posting.user_id && current_user.employer)
      @posting.destroy
      flash[:success] = "Posting Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/postings'

  end

  private
    
    def posting_params
        params.require(:posting).permit(:title, :description, :posting_id, :salary)
    end
end
class StaticPagesController < ApplicationController

  def home
  	@user = current_user
  	if user_signed_in?
  		redirect_to profile_path(@user)
  	end
  end
  
end

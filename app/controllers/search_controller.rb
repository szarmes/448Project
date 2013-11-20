class SearchController < ApplicationController

  def search
    @user=current_user
    @results = Posting.titlesearch(params[:q]) + Posting.descsearch(params[:q])
    @q = params[:q]
  end

end
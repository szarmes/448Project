class SearchController < ApplicationController

  def search
    @user=current_user
    @results = Posting.titlesearch(params[:q]) + Posting.descriptionsearch(params[:q])
    @results = @results.uniq
    @q = params[:q]
  end

end
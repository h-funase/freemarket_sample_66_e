class SearchController < ApplicationController

  def index
    @items = Item.search(params[:search])
    @search = params[:search]
  end



end

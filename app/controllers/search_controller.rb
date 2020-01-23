class SearchController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search])
    @search = params[:search]
  end

  
  def detail_search
    @search_product = Item.ransack(params[:q]) 
    @items = @search_product.result.page(params[:page])
  end
  
  private
  def set_ransack
    @q = Item.ransack(params[:q])
  end

  def detail_search_params
    params.require(:q)
    .permit(:name_cont,
            :price_gteq, 
            :price_lteq, 
            :sorts,
            :size_id,
            :brand_id, )
  end


end

class MypagesController < ApplicationController
  def index
  end

  def show
    
  end

  def logout
  end

  def edit
  end

  def selling
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def items_screen
    @items = Item.order("created_at DESC")
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

end

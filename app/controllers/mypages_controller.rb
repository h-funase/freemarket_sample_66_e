class MypagesController < ApplicationController

  before_action :set_item, only: [:selling, :destroy]

  def index
  end

  def show

  end

  def logout
  end

  def edit
  end


  def selling
    @images = @item.images
  end

  def items_screen
    @items = Item.order("created_at DESC")
  end

  def items_screen_sold
    @items = Item.order("created_at DESC")
  end


  def selling
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def selling_sold
    @item = Item.find(params[:id])
    @images = @item.images  
  end

  def personal_page
    # @items = Item.where(seller_id: current_user.id)
    @items = Item.all
    @selling_items = @items.where(seller_id: current_user.id)
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end


end

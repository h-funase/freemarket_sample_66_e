class MypagesController < ApplicationController

  def index
  end

  def show
  end

  def logout
  end

  def edit
  end


  def items_screen
    @items = Item.order("created_at DESC")
    # @user = User.find(params[:id])
    # @items = @user.items
  end


  def selling
    @item = Item.find(params[:id])
    @images = @item.images
  end

  

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to "/items/#{@item.user.id}/mypages"
  end


end

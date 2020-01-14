class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def sell_item
    @item = Item.new(item_params)
    redirect_to root_path
  end

  def credit
  end

  def logout
  end

  def sign_up
  end
  
  def login
  end

  private
  def item_params
    params.require(:item).permit( :name, :description, :category_id, :condition, :size_id, :brand, :delivery_charge_id, :delivery_way_id, :prefecture_id, :delivery_days_id, :price,)
  end
end

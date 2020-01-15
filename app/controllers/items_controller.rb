class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
    5.times { @item.images.build }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to  new_item_path 
    end
  end

  def step2
  end

  def step3_1
  end

  def step3_2
  end

  def step4
  end
  
  def step5
  end
    
  def credit
  end

  def logout
  end

  def sign_up
  end
  
  def login
  end
  
  def item_buy

  end


  private
  def item_params
    params.require(:item).permit( :name, :description, :category_id, :prefecture_id, :condition_id, :delivery_charge_id, :delivery_way_id, :delivery_days_id, :price,images_attributes: [:image_url])
  end
end

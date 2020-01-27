class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :update,]
  def index
    @items = Item.includes(:images).order("created_at DESC").limit(10)
  end

  def show
    @items = Item.find(params[:id])
    @images = @items.images
  end

  def new
    @item = Item.new
    @image = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @item.status = 0
    @item.seller_id = current_user.id
    if @item.save!
      redirect_to root_path
    else
      render :new unless @item.valid? 
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(update_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def logout
  end

  def userprofile
  end


  def item_buy
  end

  def person_check
    @address= Address.find_by(user_id: current_user.id)  
  end

  def item_screen
  end

  private
  def item_params
    params.require(:item).permit( :name, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_charge_id, :delivery_way_id, :delivery_days_id, :price,images_attributes: [:image_url])
  end

  def update_params
    params.require(:item).permit( :name, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_charge_id, :delivery_way_id, :delivery_days_id, :price,images_attributes: [:image_url,:id])
  end

  def set_category
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end

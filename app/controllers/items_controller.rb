class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order("created_at DESC").limit(10)
  end

  def show
    @items = Item.find(params[:id])
    @images = @items.images
  end

  def new
    @item = Item.new
    5.times { @item.images.build }
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def edit
    @items = Item.includes(:images)
    @item= Product.find(params[:id])
    @images = @item.images.order(id: "DESC")
  end

  def create
    @item = Item.new(item_params)
    @item.status = 0
    if @item.save!
      redirect_to controller: :items, action: :index
    else
      render :new unless @item.valid? #（バリデーションエラーがある場合、falseが返り値となります）-> false # バリデーションに引っかかった場合
    end
  end
  
# 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def logout
  end

  def userprofile
  end


  def item_buy
  end

  def person_check
  end

  def item_screen
  end


  private
  def item_params
    params.require(:item).permit( :name, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_charge_id, :delivery_way_id, :delivery_days_id, :price,images_attributes: [:image_url])
  end

end

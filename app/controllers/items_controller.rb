class ItemsController < ApplicationController
  include AjaxHelper
  before_action :set_category,             only: [:edit, :update]
  before_action :set_gon,                  only: [:edit, :update]
  before_action :registered_images_params, only: :update
  before_action :new_image_params,         only: :update
  before_action :item_update_params,       only: :update

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
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    @item.status = 0
    if @item.save!
      redirect_to root_path
    else
      render :new unless @item.valid? 
    end
  end


  def edit
  end


  def update
    @item = Item.find(params[:id])
    @images = @item.images

    # 登録済画像のidの配列を生成
    ids = @item.images.map{|image| image.id }
    # 登録済画像のうち、編集後もまだ残っている画像のidの配列を生成(文字列から数値に変換)
    exist_ids = registered_images_params[:ids].map(&:to_i)
    # 登録済画像が残っていない場合(配列に０が格納されている)、配列を空にする
    exist_ids.clear if exist_ids[0] == 0

    if (exist_ids.length != 0 || new_image_params[:images][0] != " ") && @item.update!(item_update_params)  # ||はor（または）

      # 登録済画像のうち削除ボタンをおした画像を削除
      unless ids.length == exist_ids.length
        # 削除する画像のidの配列を生成
        delete_ids = ids - exist_ids
        delete_ids.each do |id|
          @item.images.find(id).destroy
        end
      end

      # 新規登録画像があればcreate
      unless new_image_params[:images][0] == " "
        new_image_params[:images].each do |image|
          @item.images.create(image_url: image, item_id: @item.id)
        end
      end

      # flash[:notice] = '編集が完了しました'
      respond_to do |format|
        format.js { render ajax_redirect_to(item_path(@item)) }
      end
    else
      flash[:alert] = '未入力項目があります'
      rener :edit
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
    params.require(:item).permit( :name, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_charge_id, :delivery_way_id, :delivery_days_id, :price, images_attributes: [:image_url])
  end

  def item_update_params
    params.require(:item).permit( :name, :description, :category_id, :size_id, :brand_id, :prefecture_id, :condition_id, :delivery_charge_id, :delivery_way_id, :delivery_days_id, :price)
  end
  
  def registered_images_params
    params.require(:registered_images_ids).permit({ids: []})
  end

  def new_image_params
    params.require(:new_images).permit({images: []})
  end

  def set_category
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def set_gon
    @item= Item.find(params[:id])
    @images = @item.images

    gon.item = @item
    gon.images = @item.images


    # @item.images.image_urlをバイナリーデータにしてビューで表示できるようにする
    require 'base64'
    gon.images_binary_datas = []
      @item.images.each do |image|
        binary_data = File.read(image.image_url.file.file)
        gon.images_binary_datas << Base64.strict_encode64(binary_data)
      end
  end
end

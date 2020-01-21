class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # belongs_to_active_hash :condition
  # belongs_to_active_hash :size
  # belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  # belongs_to_active_hash :delivery_days
  # belongs_to_active_hash :delivery_way

  
  # アソシエーション
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :user, optional: true
  belongs_to :buyer_id, optional: true
  belongs_to :saler_id, optional: true


  scope :category_items, -> categories { includes(:images).where(category_id: categories.ids ) }
  scope :category_item,  -> category_list { includes(:images).where(category_id: category_list.id )}

  # バリデーション
  validates :name,                    presence: true #,profanity_filter: true
  validates :description,             presence: true #,profanity_filter: true
  validates :category_id,             presence: true
  validates :price,                   presence: true, inclusion: 300..9999999
  validates :condition_id,            presence: true
  validates :prefecture_id,           presence: true
  validates :delivery_charge_id,      presence: true
  validates :delivery_way_id,         presence: true
  validates :delivery_days_id,        presence: true


  # 都道府県
  enum prefecture: { 北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7, 東京都: 8, 神奈川県: 9, 埼玉県: 10, 千葉県: 11, 茨城県: 12, 栃木県: 13, 群馬県: 14, 山梨県: 15, 新潟県: 16, 長野県: 17, 富山県: 18, 石川県: 19, 福井県: 20, 愛知県: 21, 岐阜県: 22, 静岡県: 23, 三重県: 24, 大阪府: 25, 兵庫県: 26, 京都府: 27, 滋賀県: 28, 奈良県: 29, 和歌山県: 30, 鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35, 徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39, 福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47}, _prefix: true
  # コンデション
  enum condition: { 新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}, _prefix: true
  # 配送料負担
  enum delivery_charge: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  # 配送日数
  enum delivery_days: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3},_prefix: true
  # 配送方法

  enum delivery_way: { "未定": 1, "らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便(定形、定形外)": 5, "クロネコヤマト": 6, "ゆうパック": 7, "クリックポスト": 8, "ゆうパケット": 9}, _prefix: true
  enum brand: {"シャネル":1, "グッチ":2, "ルイヴィトン":3,  "シュプリーム":4, "アディダス":5, "ナイキ":6, "プーマ":7, "グラッドハンド":8, "BOSE":9, "Apple":10}, _prefix: true
  enum size: {"XXS以下":1, "XS(SS)":2, "S":3,  "M":4, "L":5, "XL(LL)":6, "2XL(3L)":7, "3XL(4L)":8, "FREE SIZE":9}, _prefix: true

end

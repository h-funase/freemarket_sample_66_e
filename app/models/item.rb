class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :condition
  # belongs_to_active_hash :size
  # belongs_to_active_hash :delivery_charge
  # belongs_to_active_hash :prefecture
  # belongs_to_active_hash :delivery_days
  # belongs_to_active_hash :delivery_way

  # active_hashを使う基準はデータが増えないもの。itemは出品すれば増えるが、sizeなどの項目は増えない

  has_many :images, dependent: :destroy

end

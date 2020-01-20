class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string     :name,               null: false 
      t.string     :category_id,        null: false, foreign_key: true
      t.string     :size_id           
      t.string     :condition_id,       null: false
      t.string     :delivery_charge_id, null: false
      t.string     :prefecture_id,      null: false
      t.string     :delivery_days_id,   null: false
      t.string     :delivery_way_id,    null: false
      t.integer    :price,              null: false
      t.integer    :buyer_id        
      t.integer    :saler_id          
      t.string     :brand_id         
      t.string     :status            
      t.timestamps
    end
  end
end

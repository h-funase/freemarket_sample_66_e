class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user,            null: false
      t.string     :name,            null: false
      t.text       :description
      t.integer    :category_id,     null: false
      t.integer    :size,            null: false
      t.integer    :condition,       null: false
      t.string     :delivery_charge, null: false
      t.string     :delivery_way,    null: false
      t.string     :delivery_days,   null: false
      t.integer    :price,           null: false
      t.integer    :saler_id,        null: false
      t.string     :brand_id,        null: false
      t.integer    :status,          null: false

      t.timestamps
    end
  end
end

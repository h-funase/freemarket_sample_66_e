class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :item_id
      t.text :image_url

      t.timestamps
    end
  end
end

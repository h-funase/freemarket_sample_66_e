class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string     :item_id, null: false
      t.string     :image_url, null: false
      t.timestamps
    end
  end
end

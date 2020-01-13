class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :prefectures, null: false
      t.string :municipality, null: false
      t.string :street_number, null: false
      t.string :building_name
      t.timestamps
    end
  end
end

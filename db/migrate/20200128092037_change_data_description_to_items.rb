class ChangeDataDescriptionToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :description, :text
  end
end

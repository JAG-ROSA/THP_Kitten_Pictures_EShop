class CreateCategoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :category_items do |t|
      t.belongs_to :category, index: true
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end

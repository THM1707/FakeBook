class CreateCategoriesPagesJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_pages, id: false do |t|
      t.integer :category_id
      t.integer :page_id
    end
  end
end

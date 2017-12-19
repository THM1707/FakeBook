class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :fb_id
      t.string :permalink_url
      t.integer :likes, default: 0
      t.integer :comments, default: 0
      t.integer :shares, default: 0
      t.string :message
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end

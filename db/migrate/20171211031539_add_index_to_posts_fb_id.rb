class AddIndexToPostsFbId < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :fb_id, unique: true
  end
end

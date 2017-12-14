class DropSaves < ActiveRecord::Migration[5.1]
  def change
    drop_table :saves
  end
end

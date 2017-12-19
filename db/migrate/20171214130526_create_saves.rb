class CreateSaves < ActiveRecord::Migration[5.1]
  def change
    create_table :saves do |t|
      t.string :permalink_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

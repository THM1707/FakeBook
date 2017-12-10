class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :permalink_url
      t.string :name

      t.timestamps
    end
  end
end

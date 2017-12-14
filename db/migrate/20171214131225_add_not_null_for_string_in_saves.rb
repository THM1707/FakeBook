class AddNotNullForStringInSaves < ActiveRecord::Migration[5.1]
  def change
    change_column_null :saves, :permalink_url, false
  end
end

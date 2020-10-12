class AddTitleToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :title, :string
    add_index :books, :title, unique: true
  end
end

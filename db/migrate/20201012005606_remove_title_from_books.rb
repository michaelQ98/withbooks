class RemoveTitleFromBooks < ActiveRecord::Migration[6.0]
  def up
    remove_column :books, :title
  end
  def down 
    remove_column :books, :title, :string
  end
end

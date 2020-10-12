class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :theme_id, null:false
      t.integer :user_id, null:false
      t.text :post_text, null:false
      t.string :contributer, null:false

      t.timestamps
    end
  end
end

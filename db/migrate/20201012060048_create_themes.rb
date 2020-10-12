class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.string :nickname, null: false
      t.text :theme_text, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

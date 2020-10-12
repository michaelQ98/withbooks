class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :url
      t.string :address, null: false
      t.text :description
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

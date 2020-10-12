class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :book_id, null: false
      t.integer :user_id, null: false
      t.text :review_text, null: false
      t.integer :when_read
      t.integer :how_feel

      t.timestamps
    end
  end
end

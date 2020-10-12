class Post < ApplicationRecord
  validates :theme_id, presence: true
  validates :user_id, presence: true
  validates :post_text, presence: true
  validates :contributer, presence: true
end

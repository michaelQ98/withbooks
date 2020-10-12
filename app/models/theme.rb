class Theme < ApplicationRecord
  validates :nickname, presence: true
  validates :theme_text, presence: true
  validates :user_id, presence: true
end

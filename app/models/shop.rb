class Shop < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
end

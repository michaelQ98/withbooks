class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :user_id, presence: true
  validates :who_recommend, presence: true
  mount_uploader :image, BookcoverUploader
end

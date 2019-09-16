class Post < ApplicationRecord
  belongs_to :user
# 投稿を降順にする.
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates  :picture, presence: true
  validates  :user_id, presence: true
  validates  :content, presence: true, length: { maximum: 140 }
end

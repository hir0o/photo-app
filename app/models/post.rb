class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader  :picture, PictureUploader
  mount_uploaders :pictures, PictureUploader
  validates  :pictures, presence: true, length: { maximum: 3 }
  validates  :user_id, presence: true
  validates  :title, presence: true, length: { maximum: 140 }
  # like関係
  has_many   :likes
  has_many   :liked_users, through: :likes, source: :user, dependent: :destroy
  # comment
  has_many :comments
  # tag
  acts_as_taggable

  def self.search(search) #ここでのself.はMicropost.を意味する
    where(['title LIKE ?', "%#{search}%"])
  end

  def self.tag_search(tag_name) #ここでのself.はMicropost.を意味する
    tagged_with("#{tag_name}")
  end


end

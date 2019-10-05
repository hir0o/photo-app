class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader  :picture, PictureUploader
  mount_uploaders :pictures, PictureUploader
  validates  :pictures, presence: true, length: { maximum: 3 }
  validates  :user_id, presence: true
  validates  :title, presence: true, length: { maximum: 50 }
  # like関係
  has_many   :likes
  has_many   :liked_users, through: :likes, source: :user, dependent: :destroy
  # comment
  has_many :comments, dependent: :destroy
  # tag
  acts_as_taggable
  # 足跡機能
  has_many :footprints
  has_many :footprint_users, through: :footprints, source: :user
  # google map api
  geocoded_by :address
  after_validation :geocode
  
  def self.search(search) #ここでのself.はMicropost.を意味する
    where(['title LIKE ?', "%#{search}%"])
  end

  def self.tag_search(tag_name) #ここでのself.はMicropost.を意味する
    tagged_with("#{tag_name}")
  end


end

class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploaders :pictures, PictureUploader
  validates  :pictures, presence: true, length: { maximum: 5 }
  validates  :user_id, presence: true
  validates  :title, presence: true, length: { maximum: 50 }
  # validates  :latitude, presence: true
  # like関係
  has_many   :likes, dependent: :destroy
  has_many   :liked_users, through: :likes, source: :user
  # comment
  has_many :comments, dependent: :destroy
  # tag
  acts_as_taggable
  # 足跡機能
  has_many :footprints, dependent: :destroy
  has_many :footprint_users, through: :footprints, source: :user
  # google map api
  geocoded_by :address
  after_validation :geocode
  
  def self.search(search)
    where(['title LIKE ?', "%#{search}%"])
  end

  def self.tag_search(tag_name)
    tagged_with("#{tag_name}")
  end


end

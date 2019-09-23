class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  has_many :posts, dependent: :destroy
  # ProfileImageアップローダーを紐付け
  mount_uploader :profile_image, ProfileImageUploader
  # like関係
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  # rerationship関係
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  # comment
  has_many :comments
 
   def following?(other_user)
     following_relationships.find_by(following_id: other_user.id)
   end
 
   def follow!(other_user)
     following_relationships.create!(following_id: other_user.id)
   end
 
   def unfollow!(other_user)
     following_relationships.find_by(following_id: other_user.id).destroy
   end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

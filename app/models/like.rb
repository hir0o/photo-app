class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :like_posts, through: :likes, source: 'post'
  validates_uniqueness_of :post_id, scope: :user_id
end

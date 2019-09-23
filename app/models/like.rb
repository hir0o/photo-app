class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # 一人が一つの投稿に対して１LIKEだけ
  validates_uniqueness_of :post_id, scope: :user_id
end

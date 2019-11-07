class RankingsController < ApplicationController
  def like
    posts = Post.all.includes(:user, :likes, :liked_users).find(Like.group(:post_id).order('count(user_id) desc').pluck(:post_id))
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(PER)
  end

  def comment
    @posts = Post.joins(:comments).group('users.id').order('count(users_id) desc').page(params[:page]).per(PER)
  end

  def view
    posts = Post.all.includes(:user, :footprints, :footprint_users).find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(PER)
  end

  Comment.joins(:post).group("posts.id").order("count_all DESC")
  Comment.joins(:post).group('comments.id').order(Arel.sql('count(comments.id) desc')).pluck(:post_id))
  Post.joins(:like).group('posts.id').order(Arel.sql('count(posts.id) desc')).pluck(:post_id))
  Post.find(Comment.group(:post_id).order('count(post_id) desc').pluck(:post_id))

end


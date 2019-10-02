class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @post = Post.find(params[:post_id])
    @like.destroy
  end

  def index
    @user = User.find(params[:user_id])
    likes = Like.where(user_id: @user)
    p = []
    likes.each do |like|
      p << Post.find_by(id: like.post_id)
      @posts = Kaminari.paginate_array(p).page(params[:page]).per(6)
    end
    respond_to do |format|
      format.html
      format.js {render 'posts/index'}
    end
  end
end

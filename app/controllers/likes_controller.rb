class LikesController < ApplicationController
  # before_action :authenticate_user!
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    p "**controller**  "*10
    p "create"
    p @like
    p @post
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      p "〜"*50
      format.js
    end
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @post = Post.find(params[:post_id])
    p "**controller** "*10
    p "destroy"
    p @like
    p @post
    @like.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      p "〜"*50
      format.js
    end
  end

  def index
    @user = User.find(params[:user_id])
    likes = Like.where(user_id: @user)
    @posts = []
    likes.each do |like|
      @posts << Post.find_by(id: like.post_id)
    end
  end
  
end

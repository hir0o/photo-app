class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
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

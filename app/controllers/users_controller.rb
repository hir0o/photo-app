class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(PER)
    respond_to do |format|
      format.html
      format.js {render 'posts/index'}
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
end

def followers
  @user  = User.find(params[:id])
  @users = @user.followers
  render 'show_follower'
end
end

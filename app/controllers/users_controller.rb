class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(PER)
    @post_places = @user.posts.select("latitude", "longitude")
    respond_to do |format|
      format.html
      format.js {render 'posts/index'}
    end
  end

  def map
    @user  = User.find(params[:id])
    @posts = @user.posts
    render 'map'
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'index'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'index'
  end
end

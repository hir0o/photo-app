class UsersController < ApplicationController
  USER_PER = 12

  def index
    if @search = params[:search]
      @users = User.search(params[:search]).page(params[:page]).per(USER_PER)
    else
      @users = User.page(params[:page]).per(USER_PER).order('created_at DESC')
    end
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
    @users = @user.followings.page(params[:page]).per(USER_PER)
    render 'index'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(USER_PER)
    render 'index'
  end
end

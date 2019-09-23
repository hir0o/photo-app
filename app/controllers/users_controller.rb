class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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

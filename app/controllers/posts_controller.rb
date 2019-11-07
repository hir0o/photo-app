class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create. destroy, new]
  def index
    if @tag_name = params[:tag_name]
      @posts = Post.tag_search(params[:tag_name]).page(params[:page]).per(PER)
    elsif @search = params[:search]
      @posts = Post.search(params[:search]).page(params[:page]).per(PER)
    else
      @posts = Post.page(params[:page]).per(PER)
    end
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    current_user.footprints.create(post_id: @post.id) if current_user
    @like = Like.new
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to current_user, flash: {success: "投稿に成功しました。"}
    else
      render :new
    end
  end

  def edit
    p params[:id]
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to current_user, flash: {success: "投稿を編集しました。"}
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.now[:success] = "投稿を削除しました。"
  end

  def map
    @posts = Post.all
  end

  private

    def posts_params
      params.require(:post).permit(
        :title, :tag_list, {pictures: []}, :address, :latitude, :longitude, :description
      )
    end
end

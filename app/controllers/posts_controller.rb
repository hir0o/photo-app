class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy new edit]
  before_action :correct_user, only: %i[edit]

  def index
    @q = Post.ransack(params[:q])
    @posts = if @tag_name = params[:tag_name]
               Post.tag_search(params[:tag_name]).page(params[:page]).per(PER)
             elsif params[:q]
               @q.result.order('created_at DESC').page(params[:page]).per(PER)
             else
               Post.page(params[:page]).per(PER)
             end
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    current_user&.footprints&.create(post_id: @post.id)
    @like = Like.new
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to current_user, flash: { success: "投稿に成功しました。" }
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to root_path
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
      :title, :tag_list, { pictures: [] }, :address, :latitude, :longitude, :description
    )
  end

  def correct_user
    @post = Post.find(params[:id])
    redirect_to(root_url) unless @post.user == current_user
  end
end

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
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    current_user.footprints.create(post_id: @post.id)
    @like = Like.new
    @comment = Comment.new
    @comments = @post.comments
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to current_user, flash: {success: "post created!"}
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  
    def posts_params
      params.require(:post).permit(:title, :tag_list, {pictures: []})
    end
  # def microposts_current_user
  #   @micropost = current_user.microposts.find_by(id: params[:id])
  #   redirect_to root_url if @micropost.nil?
  # end
end

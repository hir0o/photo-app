class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.create(content: params[:comment][:content], post_id: params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def destroy
    @comment = Comment.find_by(post_id: params[:post_id], id: params[:id])
    @comment_id = @comment.id
    @comment.delete
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(post_id: @post.id, id: params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @succeed = false
    flash.now[:success] = "コメントを更新しました。"
    if @comment.update(content: params[:comment][:content])
      @succeed = true
    end
  end

  private
    def comment_params
      params.require(:comment, :post_id).permit(:content)
    end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.build(content: params[:comment][:content], post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      else
        
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment, :post_id).permit(:content)
  end
end

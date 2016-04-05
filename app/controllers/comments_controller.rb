class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of this post!"
      redirect_to :back
    else
      flash[:alert] = "Something fucked up. Check the comment form."
      render post_path(@post.id)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "The comment has been deleted :("
    redirect_to post_path(@post.id)
  end

  private
    def comment_params
      params.require(:comment).permit(:message)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end

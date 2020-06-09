class Public::CommentsController < ApplicationController

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save
  	redirect_to post_path(@post)
  end

  def edit
  	@comment = Comment.find(params[:post_id])
  end

  def update
  	@comment = Comment.find(params[:post_id])
  	@comment.update(comment_params)
  	@post = Post.find(params[:id])
  	redirect_to post_path(@post)
  end

  def destroy
  	@comment = Comment.find(params[:post_id])
  	@comment.destroy
  	redirect_back(fallback_location: posts_path)
  end

  private
  def comment_params
  	params.require(:comment).permit(:post_comment)
  end
end

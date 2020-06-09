class Public::CommentsController < ApplicationController

  def edit
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save
  	redirect_to post_path(@post)
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:post_comment)
  end
end

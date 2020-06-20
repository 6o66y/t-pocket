# frozen_string_literal: true

class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def edit
    @comment = Comment.find(params[:post_id])
  end

  def update
    @comment = Comment.find(params[:post_id])
    if @comment.update(comment_params)
      @post = @comment.post
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @post = @comment.post
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end

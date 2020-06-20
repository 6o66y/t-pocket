# frozen_string_literal: true

class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:error] = "・Post comment can't be blank"
      redirect_back(fallback_location: posts_path)
    end
  end

  def edit
    @comment = Comment.find(params[:post_id])
  end

  def update
    @comment = Comment.find(params[:post_id])
    if @comment.update(comment_params)
      @post = Post.find(params[:id])
      redirect_to post_path(@post)
    else
      render :edit
    end
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

# frozen_string_literal: true

class Public::TimelinesController < ApplicationController
  before_action :authenticate_user!

  def timeline
    @user = User.find(current_user.id)
    @following_users = @user.following
    @posts = Post.where(user_id: @following_users).page(params[:page]).reverse_order
    @recommendations = Post.order('RANDOM()').limit(5)
  end
end

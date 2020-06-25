# frozen_string_literal: true

class Public::HomesController < ApplicationController
  def top
    @categories = Category.all
    @recommend_posts = Post.order('RAND()').limit(9)
  end
end

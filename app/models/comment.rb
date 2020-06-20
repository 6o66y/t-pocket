# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_comment, presence: true

  # コメント一覧を降順に並び替え
  default_scope -> { order(created_at: :desc) }
end

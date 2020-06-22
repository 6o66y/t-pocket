# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  attachment :image

  validates :title, presence: true, length: { maximum: 100 }
  validates :objective, length: { maximum: 200 }
  validates :body, presence: true
  validates :review, length: { maximum: 200 }
  validates :category_id, presence: true
end

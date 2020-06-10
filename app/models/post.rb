class Post < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :category, optional: true

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	attachment :image
end

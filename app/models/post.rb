class Post < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :category, optional: true

	has_many :comments, dependent: :destroy

	attachment :image
end

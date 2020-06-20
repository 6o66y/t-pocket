# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User' # 存在しないFollowクラスではなく、Userクラスを参照

  validates :user_id, presence: true
  validates :follow_id, presence: true

end

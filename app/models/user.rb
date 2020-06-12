class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :profile_image

  # [設定]退会するとログインできない
  def active_for_authentication?
    self.is_deleted == false
  end

  # フォロー機能
  # フォローユーザーを取得
  has_many :relationships
  has_many :following, through: :relationships, source: :follow

  # フォロワーを取得
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id' # follow_idを入口にrelaitonshipsテーブルにアクセス
  has_many :followers, through: :reverse_of_relationships, source: :user

  # フォロー機能のメソッド
  def follow(other_user) # フォローする
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user) # フォローをはずす
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user) # フォローしていればtrueを返す
    self.following.include?(other_user)
  end
end

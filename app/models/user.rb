# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :to_do_lists, dependent: :destroy

  validates :username, presence: true, length: { maximum: 15 }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, length: { maximum: 200 }
  validates :introduction, length: { maximum: 200 }

  attachment :profile_image

  # [設定]退会するとログインできない
  def active_for_authentication?
    self.is_deleted == false
  end

  # フォロー機能
  # フォローユーザーを取得
  has_many :relationships, dependent: :destroy
  has_many :following, through: :relationships, source: :follow

  # フォロワーを取得
  # follow_idを入口にrelaitonshipsテーブルにアクセス
  has_many :reverse_of_relationships, dependent: :destroy, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  # フォロー機能のメソッド
  # フォローする
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  # フォローをはずす
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  # フォローしていればtrueを返す
  def following?(other_user)
    self.following.include?(other_user)
  end
end

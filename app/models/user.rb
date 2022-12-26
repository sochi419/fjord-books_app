# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed

  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :reverse_of_follows, source: :follower

  def follow(user_id)
    follows.find_or_create_by(followed_id: user_id)
  end

  def unfollow(user_id)
    follows.find_by(followed_id: user_id)&.destroy
  end

  def following?(user)
    followings.exists?(id: user.id)
  end
end

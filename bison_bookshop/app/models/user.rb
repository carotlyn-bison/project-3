class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  validates :email, uniqueness: true
  has_and_belongs_to_many :books
  has_many :reviews
  #following/follower functionality
  #https://www.railstutorial.org/book/following_users
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  def follow(other_user)
    following << other_user
  end
  def unfollow(other_user)
    following.delete(other_user)
  end
  def following?(other_user)
    following.include?(other_user)
  end
end

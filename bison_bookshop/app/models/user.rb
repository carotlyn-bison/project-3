class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  validates :email, uniqueness: true
  has_and_belongs_to_many :books
  has_many :reviews
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
end

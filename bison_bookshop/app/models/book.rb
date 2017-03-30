class Book < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :users

end

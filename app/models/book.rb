class Book < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :genres_books
  has_many :genres, through: :genres_books
  has_one_attached :image
  has_many :ratings
end

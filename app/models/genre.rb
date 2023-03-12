class Genre < ApplicationRecord

  has_many :genres_books
  has_many :books, through: :genres_books

  validates_uniqueness_of :name
end

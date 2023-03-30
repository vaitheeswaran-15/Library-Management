class Book < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :genres_books
  has_many :genres, through: :genres_books
  has_one_attached :image
  has_many :ratings
  belongs_to :student
  has_and_belongs_to_many :book_read_status,
                          join_table: 'book_read_status',
                          class_name: 'Student',
                          inverse_of: :book_read_status
end

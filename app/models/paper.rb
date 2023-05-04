class Paper < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :genres_papers
  has_many :genres, through: :genres_papers
  has_one_attached :image
  has_many :ratings
end
class Paper < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :genres_papers
  has_many :genres, through: :genres_papers
  has_one_attached :image
  has_many :ratings
  belongs_to :student
  has_and_belongs_to_many :paper_read_status,
                          join_table: 'paper_read_status',
                          class_name: 'Student',
                          inverse_of: :paper_read_status
end

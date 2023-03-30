class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  has_and_belongs_to_many :book_read_status,
                          join_table: 'book_read_status',
                          class_name: 'Book',
                          inverse_of: :book_read_status
end

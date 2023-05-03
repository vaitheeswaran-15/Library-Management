class Category < ApplicationRecord

  has_many :papers, dependent: :destroy
end

class Rating < ApplicationRecord
  belongs_to :book, counter_cache: true
end

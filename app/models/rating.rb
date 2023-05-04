class Rating < ApplicationRecord
  belongs_to :paper, counter_cache: true
end

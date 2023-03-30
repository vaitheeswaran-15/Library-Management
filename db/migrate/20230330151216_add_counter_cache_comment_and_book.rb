class AddCounterCacheCommentAndBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :comments_count, :integer
    add_column :books, :ratings_count, :integer
  end
end

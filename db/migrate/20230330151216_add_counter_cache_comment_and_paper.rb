class AddCounterCacheCommentAndPaper < ActiveRecord::Migration[6.1]
  def change
    add_column :papers, :comments_count, :integer
    add_column :papers, :average_rating, :float
    add_column :papers, :ratings_count, :integer

    # Populating the counter cache for existing records
    Paper.find_each do |article|
      Paper.reset_counters(article.id, :comments)
      Paper.reset_counters(article.id, :ratings)
    end
  end
end

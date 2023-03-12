class CreateGenresBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :genres_books do |t|
      t.references :book, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end
end

json.extract! book, :id, :name, :category, :release_date, :language, :created_at, :updated_at
json.url book_url(book, format: :json)

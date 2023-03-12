class GenresBooksController < ApplicationController

  before_action :set_category_book
  before_action :set_genre

  def create
    @genres_book = @book.genres_books.new(genre_id: @genre.id)
    respond_to do |format|
      if @genres_book.save
        format.html { redirect_to category_book_path(@category, @book), notice: "Genre applied successfully." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to category_book_path(@category, @book), notice: "Genre add failed." }
        format.json { render json: @genres_book.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category_book
    @category = Category.find_by(id: params[:category_id])
    @book = @category.books.find_by(id: params[:book_id])
  end

  def set_genre
    @genre = Genre.find_or_create_by(name: params[:genres_book][:genre_name].downcase)
  end
end

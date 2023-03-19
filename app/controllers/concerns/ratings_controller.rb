class RatingsController < ApplicationController
  before_action :set_category_book


  def create
    @rating = @book.ratings.new(ratings_params)
    @rating.save!
    redirect_to category_book_path(@category, @book), notice: 'Rating was successfully created.'
  end

  private

  def set_category_book
    @category = Category.find_by(id: params[:category_id])
    @book = @category.books.find_by(id: params[:book_id])
  end

  def ratings_params
    params.require(:rating).permit(:rating)
  end
end
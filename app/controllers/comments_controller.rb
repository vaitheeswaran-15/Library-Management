class CommentsController < ApplicationController

  before_action :set_category_book

  def create
    @comment = @book.comments.new(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to category_book_path(@category, @book), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category_book
    @category = Category.find_by(id: params[:category_id])
    @book = @category.books.find_by(id: params[:book_id])
  end

  def comments_params
    params.require(:comment).permit(:comment_text)
  end
end

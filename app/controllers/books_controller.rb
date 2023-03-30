class BooksController < ApplicationController
  load_and_authorize_resource
  before_action :set_category
  before_action :set_book, only: %i[show edit update destroy read_status]
  # GET /books or /books.json
  def index
    if @category.present?
      @books = @category.books
    else
      @books = Book.all
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.student_id = current_student.id

    respond_to do |format|
      if @book.save
        format.html { redirect_to category_book_path(@category, @book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to category_book_path(@category, @book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to category_books_url(@category), notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def read_status
    @student = current_student
    unless @book.book_read_status_ids.include? @student.id
      @book.book_read_status << @student
    end
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = @category.books.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:name, :category_id, :release_date, :language, :image)
  end
end

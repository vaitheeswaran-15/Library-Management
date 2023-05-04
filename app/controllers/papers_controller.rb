class PapersController < ApplicationController
  before_action :set_category
  before_action :set_paper, only: %i[ show edit update destroy ]

  # GET /papers or /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1 or /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers or /papers.json
  def create
    @paper = Paper.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Paper was successfully created." }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1 or /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Paper was successfully updated." }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1 or /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to category_papers_url(@category), notice: "Paper was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_paper
    @paper = @category.papers.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def paper_params
    params.require(:paper).permit(:name, :category_id, :release_date, :language, :image)
  end
end

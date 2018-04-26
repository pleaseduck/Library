class BooksController < ApplicationController

  def index
    if params[:library_id]
      @libraries = Library.all
      @books = Book.all.where(library_id: params[:library_id])
    else
      @libraries = Library.all
      @books = Book.all
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @book = Book.where(id: params[:id]).first
  end

  # GET /pages/new
  def new
    @book = Book.new
  end

  # GET /pages/1/edit
  def edit
    @book = Book.where(id: params[:id]).first
  end

  # POST /pages
  # POST /pages.json
  def create
    @book = Book.create(book_params)
    if @book.errors.empty?
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @book = Book.where(id: params[:id]).first
    @book.update_attributes(book_params)
    if @book.errors.empty?
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @book = Book.where(id: params[:id]).first
    @book.destroy
    redirect_to books_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      #params.fetch(:page, {name})
      params[:book].permit(:name, :cipher,:author, :publishing_house, :publishing_date, :price,  :library_id)
    end


end

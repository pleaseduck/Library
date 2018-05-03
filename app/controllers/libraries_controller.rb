class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @library = Library.where(id: params[:id]).first
  end

  # GET /pages/new
  def new
    @library = Library.new
  end

  # GET /pages/1/edit
  def edit
    @library = Library.where(id: params[:id]).first
  end

  # POST /pages
  # POST /pages.json
  def create
    @library = Library.create(library_params)
    if @library.errors.empty?
      redirect_to library_path(@library)
    else
      render "new"
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @library = Library.where(id: params[:id]).first
    @library.update_attributes(library_params)
    if @library.errors.empty?
      redirect_to library_path(@library)
    else
      render "edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @library = Library.where(id: params[:id]).first
    @library.destroy
    redirect_to libraries_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      #params.fetch(:page, {name})
      params[:library].permit(:name, :address, :number)
    end
end

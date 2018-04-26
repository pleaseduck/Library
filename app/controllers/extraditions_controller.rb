class ExtraditionsController < ApplicationController

  def index
    if params[:library_id]
      @libraries = Library.all
      @books = Book.all.where(library_id: params[:library_id])
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
      @extraditions = Extradition.all.where(library_id: params[:library_id])
    else
      @extraditions = Extradition.all
      @libraries = Library.all
      @subscribers = Subscriber.all
      @books = Book.all
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @extradition = Extradition.where(id: params[:id]).first
  end

  # GET /pages/new
  def new
    @extradition = Extradition.new
    #@books = Book.all
    #@subscribers = Subscriber.all
    if params[:library_id]
      @libraries = Library.all
      @books = Book.all.where(library_id: params[:library_id])
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
      @extraditions = Extradition.all.where(library_id: params[:library_id])
    else
      @extraditions = Extradition.all
      @libraries = Library.all
      @subscribers = Subscriber.all
      @books = Book.all
    end
  end

  # GET /pages/1/edit
  def edit
    @extradition = Extradition.where(id: params[:id]).first
  end

  # POST /pages
  # POST /pages.json
  def create
    if params[:library_id]
      @libraries = Library.all
      @books = Book.all.where(library_id: params[:library_id])
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
      @extraditions = Extradition.all.where(library_id: params[:library_id])
    else
      @extraditions = Extradition.all
      @libraries = Library.all
      @subscribers = Subscriber.all
      @books = Book.all
    end
    @extradition = Extradition.create(extradition_params)
    if @extradition.errors.empty?
      redirect_to extradition_path(@extradition)
    else
      render "new"
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @extradition = Extradition.where(id: params[:id]).first
    @extradition.update_attributes(extradition_params)
    if @extradition.errors.empty?
      redirect_to extradition_path(@extradition)
    else
      render "edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @extradition = Extradition.where(id: params[:id]).first
    @extradition.destroy
    redirect_to extraditions_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def extradition_params
      #params.fetch(:page, {name})
      params[:extradition].permit(:subscriber_id, :book_id,:library_id, :extradition_date)
    end

end

class IssuancesController < ApplicationController

  def index
    @issuances = Issuance.all
    if params[:book_id]
      @issuances = Issuance.all.where(book_id: params[:book_id])
    end

    if params[:subscriber_id]
      @issuances = Issuance.all.where(subscriber_id: params[:subscriber_id])
    end

    if params[:search] && params[:search_sub] && params[:library_id]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
      @subscribers = @subscribers.where("name LIKE '%#{params[:search_sub]}%'")
      @books = Book.all.where(library_id: params[:library_id])
      @books = @books.where("name LIKE '%#{params[:search_book]}%'")
    elsif params[:search] && params[:search_sub] && params[:library_id]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
      @subscribers = @subscribers.where("name LIKE '%#{params[:search_sub]}%'")
      @books = Book.all.where(library_id: params[:library_id])
      @books = @books.where("name LIKE '%#{params[:search_book]}%'")
    elsif params[:search]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all
      @books = Book.all
    elsif params[:library_id]
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
    else
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all
      @books = Book.all
    end

  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @issuance = Issuance.where(id: params[:id]).first
  end

  # GET /pages/new
  def new
    @issuance = Issuance.new
    if params[:search] || params[:library_id]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
    elsif params[:library_id]
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
    else
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all
      @books = Book.all
    end
  end

  # GET /pages/1/edit
  def edit
    @issuance = Issuance.where(id: params[:id]).first
  end

  # POST /pages
  # POST /pages.json
  def create
    if params[:library_id]
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
      @issuances = Issuance.all.where(library_id: params[:library_id])
    else
      @issuances = Issuance.all
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @subscribers = Subscriber.all
      @books = Book.all
    end
    @issuance = Issuance.create(issuance_params)
    if @issuance.errors.empty?
      redirect_to issuance_path(@issuance)
    else
      render "new"
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @issuance = Issuance.where(id: params[:id]).first
    @issuance.update_attributes(Issuance_params)
    if @issuance.errors.empty?
      redirect_to issuance_path(@issuance)
    else
      render "edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @issuance = Issuance.where(id: params[:id]).first
    @issuance.destroy
    redirect_to issuances_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def issuance_params
      #params.fetch(:page, {name})
      params[:issuance].permit(:subscriber_id, :book_id,:library_id, :issuance_date, :search, :search_sub, :utf8)
    end

end

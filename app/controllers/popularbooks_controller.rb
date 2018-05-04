class PopularbooksController < ApplicationController
  def index
    
    if params[:search] && params[:library_id]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
      @books = @books.order(issuances_count: :desc)
    elsif params[:library_id]
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
      @books = @books.order(issuances_count: :desc)
    elsif params[:search]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.order(issuances_count: :desc)
    else
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @books = Book.all
      @books = @books.order(issuances_count: :desc)
    end
  end
end

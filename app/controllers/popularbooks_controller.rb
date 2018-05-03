class PopularbooksController < ApplicationController
  def index
  #  if params[:library_id]
  #    @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
  #    @books = Book.all.where(library_id: params[:library_id]).order(extraditions_count: :desc)
  #  else
  #    @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
  #    @books = Book.all.order(extraditions_count: :desc)
  #  end
  #end

    if params[:search] && params[:library_id]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
    elsif params[:library_id]
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
      @books = Book.all.where(library_id: params[:library_id])
    elsif params[:search]
      @libraries = Library.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page], :per_page => 5)
      @books = Book.all
    else
      @libraries = Library.all.paginate(:page => params[:page], :per_page => 5)
        @books = Book.all
    end
  end
end

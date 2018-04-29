class PopularbooksController < ApplicationController
  def index
    if params[:library_id]
      @libraries = Library.all
      @books = Book.all.where(library_id: params[:library_id]).order(extraditions_count: :desc)
    else
      @libraries = Library.all
      @books = Book.all.order(extraditions_count: :desc)
    end
  end
end

#<%= select_tag(:library_id, options_from_collection_for_select(@libraries, :id, :name)) %>

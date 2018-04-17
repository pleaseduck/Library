class Book < ApplicationRecord
  has_many :extraditions
  has_many :subscribers, :through => :extraditions

  belongs_to :library

  def create
    Book.create(book_params)
  end

  private

  def book_params
    params.require(book).permit(:library, :library_id)
  end

end

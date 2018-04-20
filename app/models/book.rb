class Book < ActiveRecord::Base
  has_many :extraditions
  has_many :subscribers, :through => :extraditions

  belongs_to :library, dependent: :destroy

  validates :name, presence: true
  validates :cipher, presence: true
  validates :library_id, presence: true

  def create
    Book.create(book_params)
  end

  private

  def book_params
    params.require(book).permit(:library, :library_id)
  end

end

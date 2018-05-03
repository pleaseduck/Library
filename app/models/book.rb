class Book < ActiveRecord::Base
  has_many :issuances
  has_many :subscribers, :through => :issuances

  belongs_to :library, dependent: :destroy

  validates_presence_of :name,
   :message => "Поле названия книги не может быть пустым"

   validates_presence_of :author,
    :message => "Поле автора не может быть пустым"

    validates_presence_of :price,
     :message => "Поле цены не может быть пустым"

    validates_presence_of :cipher,
      :message => "Поле шифра книги не может быть пустым"

      validates_presence_of :library,
       :message => "Поле библиотеки не может быть пустым"
      validates_associated :library,
      :message => "dgk"
  def create
    Book.create(book_params)
  end

  private

  def book_params
    params.require(book).permit(:library, :library_id)
  end

end

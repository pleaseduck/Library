class Library < ActiveRecord::Base
  has_many :subscribers, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :books, dependent: :destroy



  validates_presence_of :name,
   :message => "Поле названия библиотеки не может быть пустым"
   validates_presence_of :number,
    :message => "Поле номера библиотеки не может быть пустым"
    validates_presence_of :address,
     :message => "Поле адреса библиотеки не может быть пустым"

end

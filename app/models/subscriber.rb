class Subscriber < ActiveRecord::Base
  belongs_to :library
  has_many :issuances, dependent: :destroy
  has_many :books, :through => :issuances

  validates_presence_of :name,
   :message => "Поле имени не может быть пустым"
  validates_presence_of :surname,
   :message => "Поле фамилии не может быть пустым"
  validates_presence_of :patronymic,
   :message => "Поле отчества не может быть пустым"
   validates_presence_of :address,
    :message => "Поле адреса не может быть пустым"
  validates_presence_of :phone_number,
   :message => "Поле номера телефона не может быть пустым"
  validates_presence_of :ticket_number,
   :message => "Поле номера билета не может быть пустым"
  validates :library_id, presence: true
  validates_presence_of :library_id,
   :message => "Поле выбора библиотеки не может быть пустым"

  def create
    Subscriber.create(subscriber_params)
  end

  private

  def subscriber_params
    params.require(subscriber).permit(:library, :library_id)
  end

end

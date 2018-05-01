class Extradition < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :book

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  validates_presence_of :subscriber_id,
   :message => "Поле абонента не может быть пустым"
   validates_presence_of :book_id,
    :message => "Поле книги не может быть пустым"

    validates_presence_of :extradition_date,
     :message => "Поле даты выдачи не может быть пустым"
  def create
    Extradition.create(extradition_params)
  end

  private

  def extradition_params
    params.require(extradition).permit( :subscriber_id, :book_id)
  end
end

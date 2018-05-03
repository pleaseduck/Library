class Issuance < ActiveRecord::Base
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

    validates_presence_of :issuance_date,
     :message => "Поле даты выдачи не может быть пустым"
  def create
    Issuance.create(issuance_params)
  end

  private

  def issuance_params
    params.require(issuance).permit( :subscriber_id, :book_id)
  end
end

class Subscriber < ApplicationRecord
  belongs_to :library
  has_many :extraditions
  has_many :books, :through => :extraditions

  validates :name, presence: true
  validates :surname, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :ticket_number, presence: true
  validates :library_id, presence: true

  def create
    Subscriber.create(subscriber_params)
  end

  private

  def subscriber_params
    params.require(subscriber).permit(:library, :library_id)
  end

end

class Extradition < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :book
  validates :subscriber_id, presence: true
  validates :book_id, presence: true
  validates :extradition_date, presence: true

  def create
    Extradition.create(extradition_params)
  end

  private

  def extradition_params
    params.require(extradition).permit( :subscriber_id, :book_id)
  end
end

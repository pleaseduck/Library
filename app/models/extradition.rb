class Extradition < ApplicationRecord
  belongs_to :subscriber
  belongs_to :book

  def create
    Extradition.create(extradition_params)
  end

  private

  def extradition_params
    params.require(extradition).permit( :subscriber_id, :book_id)
  end
end

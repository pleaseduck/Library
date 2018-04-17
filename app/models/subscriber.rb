class Subscriber < ApplicationRecord
  belongs_to :library
  has_many :extraditions
  has_many :books, :through => :extraditions

  def create
    Subscriber.create(subscriber_params)
  end

  private

  def subscriber_params
    params.require(subscriber).permit(:library, :library_id)
  end

end

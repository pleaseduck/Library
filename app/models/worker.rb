class Worker < ActiveRecord::Base

  belongs_to :library

  validates :name, presence: true
  validates :surname, presence: true
  validates :position, presence: true
  validates :library_id, presence: true


  def create
    Worker.create(worker_params)
  end

  private

  def worker_params
    params.require(worker).permit(:library, :library_id)
  end

end

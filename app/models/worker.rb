class Worker < ApplicationRecord

  belongs_to :library

  def create
    Worker.create(worker_params)
  end

  private
  
  def worker_params
    params.require(worker).permit(:library, :library_id)
  end

end

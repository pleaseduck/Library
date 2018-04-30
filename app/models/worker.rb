class Worker < ActiveRecord::Base

  belongs_to :library

  validates_presence_of :name,
   :message => "Поле имени не может быть пустым"
  validates_presence_of :surname,
   :message => "Поле фамилии не может быть пустым"
  validates_presence_of :patronymic,
   :message => "Поле отчества не может быть пустым"
  validates_presence_of :birthday,
   :message => "Поле даты рождения не может быть пустым"
  validates_presence_of :employment_day,
   :message => "Поле даты принятия на работу не может быть пустым"
  validates_presence_of :education,
   :message => "Поле образования не может быть пустым"
  validates_presence_of :position,
   :message => "Поле должности не может быть пустым"
  validates_presence_of :library_id,
   :message => "Поле выбора библиотеки не может быть пустым"



  def create
    Worker.create(worker_params)
  end

  private

  def worker_params
    params.require(worker).permit(:library, :library_id)
  end

end

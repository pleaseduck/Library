class Library < ActiveRecord::Base
  has_many :subscribers, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :number, presence: true
  validates :address, presence: true
end

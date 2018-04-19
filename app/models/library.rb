class Library < ApplicationRecord
  has_many :subscribers
  has_many :workers
  has_many :books

  validates :name, presence: true
  validates :number, presence: true
  validates :address, presence: true
end

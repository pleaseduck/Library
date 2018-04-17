class Subscriber < ApplicationRecord
  has_many :extraditions
  has_many :books, through: :extraditions
end

class Book < ApplicationRecord
  has_many :extraditions
  has_many :subscribers, through: :extraditions
end

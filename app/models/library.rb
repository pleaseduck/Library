class Library < ApplicationRecord
  has_many :subscribers
  has_many :workers
  has_many :books
end

class Company < ApplicationRecord
  translates :title
  validates_presence_of :title
  has_many :branches
end

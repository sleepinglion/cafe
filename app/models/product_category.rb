class ProductCategory < ApplicationRecord
  validates_presence_of :title
  belongs_to :branch
  has_many :products, dependent: :destroy
end

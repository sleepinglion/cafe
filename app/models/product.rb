class Product < ApplicationRecord
  validates_presence_of :title
  belongs_to :branch
  belongs_to :product_category, counter_cache: true
  has_many :orders, :through => :orders_products
  has_one :product_picture, dependent: :destroy
  accepts_nested_attributes_for :product_picture, :allow_destroy => true
end

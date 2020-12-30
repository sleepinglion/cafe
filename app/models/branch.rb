class Branch < ApplicationRecord
  #translates :title
  validates_presence_of :title
  belongs_to :company, counter_cache: true
  has_one :branch_picture, dependent: :destroy
  has_many :admins, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :branches_payments
end

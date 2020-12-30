class Account < ApplicationRecord
  after_initialize :default_values
  belongs_to :account_category
  belongs_to :branch
  belongs_to :user, counter_cache: true
  has_many :accounts_orders, dependent: :destroy
  has_many :accounts_products, dependent: :destroy
  has_many :accounts_payments, dependent: :destroy
  has_many :orders, :through => :accounts_orders
  has_many :products, :through => :accounts_products
  has_many :payments, :through => :accounts_payments

  private

  def default_values
    self.transaction_date ||= Date.today
  end
end

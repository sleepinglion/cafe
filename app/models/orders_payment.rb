class OrdersPayment < ApplicationRecord
  belongs_to :order, autosave: true, counter_cache: true
  belongs_to :payment, autosave: true, counter_cache: true
end

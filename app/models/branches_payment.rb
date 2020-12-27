class BranchesPayment < ApplicationRecord
  belongs_to :branch, autosave: true, counter_cache: true
  belongs_to :payment, autosave: true, counter_cache: true
end

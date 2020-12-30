class BranchesPayment < ApplicationRecord
  belongs_to :branch
  belongs_to :payment
end

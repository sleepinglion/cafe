class PointLog < ApplicationRecord
  belongs_to :point, counter_cache: true
end

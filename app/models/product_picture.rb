class ProductPicture < ApplicationRecord
  belongs_to :product, autosave: true, counter_cache: true
  mount_uploader :picture, ProductPictureUploader
end

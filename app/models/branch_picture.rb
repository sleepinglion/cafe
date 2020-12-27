class BranchPicture < ApplicationRecord
  belongs_to :branch, autosave: true, counter_cache: true
  mount_uploader :picture, BranchPictureUploader
end

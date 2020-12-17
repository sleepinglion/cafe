class User < ActiveRecord::Base
  validates_length_of :name, within: 2..50
  # mount_uploader :photo, UserUploader
  belongs_to :branch
  has_many :orders, dependent: :destroy
  has_many :accounts, dependent: :nullify
end

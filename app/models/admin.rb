class Admin < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
    validates_length_of :login_id, within: 4..40
    validates_uniqueness_of :login_id
    validates_length_of :name, within: 1..60, allow_blank: true
    # mount_uploader :photo, AdminUploader

    belongs_to :branch, counter_cache: true
    # has_many :roles_admin
    # has_many :role, through: :roles_admin

    def timeout_in
        1.day
    end

    def email_required?
        false
    end
end

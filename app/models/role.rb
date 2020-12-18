class Role < ActiveRecord::Base
    validates_presence_of :title
    has_many :roles_admin, dependent: :destroy
    has_many :admin, through: :roles_admin, dependent: :destroy
    has_many :operator, through: :roles_admin, dependent: :destroy
end

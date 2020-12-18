class Operator < ActiveRecord::Base
    self.table_name = 'admins'
    attr_accessor :password, :password_confirmation
    validates_length_of :login_id, within: 4..40
    validates_uniqueness_of :login_id, :name, :email
    validates_confirmation_of :password
    validates_length_of :password, within: 4..40, allow_blank: true
    #  translates :name

    has_many :roles_admin, foreign_key: :admin_id
    has_many :role, through: :roles_admin

    accepts_nested_attributes_for :roles_admin

    def password=(pass)
        if pass.present?
            @password = pass
            admin = Admin.new(login_id: login_id, password: pass)
            self.encrypted_password = admin.encrypted_password
        end
    end
end

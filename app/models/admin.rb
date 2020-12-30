class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
  #translates :name

  validates_length_of :email, within: 4..40
  validates_uniqueness_of :email
  validates_length_of :name, within: 1..60
  validates_length_of :password, :within => 5..255

  belongs_to :branch, counter_cache: true
  has_one :admin_picture, dependent: :destroy
  has_many :roles_admin
  has_many :role, :through => :roles_admin
  has_many :admin_login_log, :dependent=>:destroy
  accepts_nested_attributes_for :admin_picture, :allow_destroy => true

  def role?(role)
    return !!self.role.find_by_title(role)
  end

  def timeout_in
    1.day
  end
end

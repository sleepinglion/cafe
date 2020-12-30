class Admins::SessionsController < Devise::SessionsController
  layout 'admin/application'

  def create
    super

    require 'ipaddr'
    AdminLoginLog.create!(admin_id: current_admin.id,client_ip: IPAddr.new("192.168.0.1").to_i)
  end

  def after_sign_in_path_for(_resource)
    session['user_return_to'] || root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    if Rails.application.config.i18n.default_locale==I18n.locale
      new_admin_session_path()
    else
      new_admin_session_path(:locale=>I18n.locale)
    end
  end
end

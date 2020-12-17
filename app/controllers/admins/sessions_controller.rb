class Admins::SessionsController < Devise::SessionsController
  layout 'admin/application'

  def after_sign_in_path_for(_resource)
    session['user_return_to'] || root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_admin_session_path
  end
end

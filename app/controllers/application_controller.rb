class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    if current_user.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end
end

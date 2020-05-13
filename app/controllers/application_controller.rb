class ApplicationController < ActionController::Base

  before_action :set_locale

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      root_path
    end
  end

  def default_url_options
    current_locale = I18n.locale
    { lang: (current_locale unless current_locale == I18n.default_locale) }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end

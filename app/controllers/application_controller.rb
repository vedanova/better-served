class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :reject_locked!, if: :devise_controller?

  before_action :set_locale

  # Devise permitted params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation,
      :first_name,
      :last_name,
      :organisation,
      :organisation_attributes => [:name])
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation,
      :current_password,
      :first_name,
      :last_name,
      :organisation,
      :organisation_attributes => [:name]
      ) 
    }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(
        :login, :username, :email, :password, :remember_me) }

  end
  
  # Redirects on successful sign in
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    login_path if is_navigational_format?
  end
  
  # Auto-sign out locked users
  def reject_locked!
    if current_user && current_user.locked?
      sign_out current_user
      user_session = nil
      current_user = nil
      flash[:alert] = "Your account is locked."
      flash[:notice] = nil
      redirect_to root_url
    end
  end
  helper_method :reject_locked!
  
  # Only permits admin users
  def require_admin!
    authenticate_user!
    
    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
  helper_method :require_admin!

  def set_locale
    I18n.locale = if params[:locale] && I18n.available_locales.include?(params[:locale].try(:to_sym))
                    params[:locale]
                  else
                    extract_locale_from_subdomain
                  end
  end

  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 gr.application.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.include?(parsed_locale.try(:to_sym)) ? parsed_locale : set_locale_from_browser_language
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  def set_locale_from_browser_language
    lang = request.env['HTTP_ACCEPT_LANGUAGE']
    if lang
      lang = lang.scan(/^[a-z]{2}/).first
      if I18n.available_locales.include?(lang.to_sym)
        I18n.locale = lang
      end
    else
      I18n.locale = 'en'
    end
  end

end

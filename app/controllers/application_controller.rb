class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  # this add locale parameter into all link url (because this option is in url_for, which all links inheriate)
  def default_url_options
    { locale: I18n.locale }
  end


  #def set_locale
  #  I18n.locale = params[:locale] || I18n.default_locale
  #end


  #include HttpAcceptLanguage::AutoLocale  #<--- Failed this way
  def set_locale
    # Trivial usage
    #I18n.locale = extract_locale_from_accept_language_header

    # Use gem:http_accept_language instead
    get_locale = params[:locale]
    if get_locale.blank?
      get_locale = http_accept_language.compatible_language_from(I18n.available_locales)
    end
    I18n.locale = get_locale
  end

  #private
  #def extract_locale_from_accept_language_header
  #  # This is a trivial usage, in prod, use gem http_accept_language insead
  #  request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  #end

end

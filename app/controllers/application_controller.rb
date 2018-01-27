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

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end

  private
  def extract_locale_from_accept_language_header
    aa = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    #render plain: aa
  end

end

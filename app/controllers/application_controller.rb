class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :prefer_html?
  hide_action :prefer_html?, :set_html_preference

  def prefer_html?
    session[:html_preference] == 'true'
  end

  def set_html_preference(preference)
    logger.info preference
    logger.info session[:html_preference]
    session[:html_preference] = preference
    logger.info preference
    logger.info session[:html_preference]
  end

  private

  def authorize
    unless Rails.env.test?
      authenticate_or_request_with_http_basic do |username, password|
        username == 'copy' && password == 'copter'
      end
    end
  end
end

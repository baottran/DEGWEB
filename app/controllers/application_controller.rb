class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # was after_filter before.  NOW after_action
  after_action :allow_iframe
  
  protect_from_forgery with: :exception

  include SessionsHelper

  def allow_iframe
    response.headers.delete "X-Frame-Options"
  end
end

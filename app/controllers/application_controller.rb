class ApplicationController < ActionController::Base
  before_action :authenticate_user! 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
helper_method :current_user

  def welcome
    @current_user=current_user
  end

private
  def authenticate_user!
      Rails.logger.info "AUTHENTICATE"
      Rails.logger.info session.to_hash
      unless user=current_user
          redirect_to '/login'
      end
    cookies.signed[:user_id] = session[:user_id]
  end
end

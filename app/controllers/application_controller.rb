class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login_required?

  def current_user
    @current_user ||= User.find_by(name: session[:username])
  end

  private
  def login_required?
    redirect_to new_session_path if current_user.blank?
  end
end

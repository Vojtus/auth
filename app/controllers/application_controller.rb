/media/faust/UUI/daiquiri_newclass ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?

  private

  def sign_in(user)
  	session[:user_id] = user.id if user.present?
  end

  def sign_out
  	session[:user_id] = nil
  end

  def user_logged_in!
    return if current_user?
    flash[:alert] = "Please sign to view this resource!"
    redirect_to login_url
  end

  def current_user
  	@current_user ||= User.find_by id: session[:user_id] if session[:user_id]
  end

  def current_user?
    current_user.present?
  end
end

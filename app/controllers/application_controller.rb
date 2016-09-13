class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin
    if current_user && current_user.admin === false
      flash[:alert] = 'You are not authorized'
      redirect_to '/'
    elsif !current_user
      flash[:alert] = "Your are not logged in"
      redirect_to '/'
    end
  end

  helper_method :current_user
end

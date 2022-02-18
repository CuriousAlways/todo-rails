class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :authenticate 

  private def authenticate
    unless current_user
      redirect_to login_path, alert: 'please login'
    end
  end

  private def current_user
    @current_user ||= User.find_by(id: session[:id])
  end
end

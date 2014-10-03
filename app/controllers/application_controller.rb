class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user_from_token!
    if current_user.nil?
      render json: {
        message: 'Unauthorized request'
      }, status: 401
    end
  end

  def current_user
    if token = params[:authentication_token]
      User.find_by_auth_token token
    else
      super
    end
  end
end

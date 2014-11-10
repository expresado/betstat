class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

rescue_from(ActionController::RoutingError) {
    render :template => '404'
  }
  protect_from_forgery with: :exception
end

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def user_not_authorized(exception)
    redirect_to main_app.root_path
  end

  def not_found
    redirect_to main_app.root_path
  end
end

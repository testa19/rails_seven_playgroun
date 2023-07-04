class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= Message.last
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :current_user, :user_signed_in?
end

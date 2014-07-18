class ApplicationController < ActionController::Base

  protect_from_forgery :with => :exception

  def require_user
    if !session[:user_id]
        redirect_to login_path
    end
  end
end

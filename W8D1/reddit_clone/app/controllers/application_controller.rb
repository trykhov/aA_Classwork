class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login(user)
        @current_user = user 
        session[:session_token] = user.session_token
    end

    def logout
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end

    def logged_in?
        !current_user.nil?
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end

    def is_moderator?(moderator_id)
        current_user.id == moderator_id
    end

end
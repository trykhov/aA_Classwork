class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    # helper_method allows specified methods to be used in the views
    helper_method :current_user, :logged_in?

    def logged_in?
        # if user can't be found, then return false --> not logged in
        user = User.find_by(session_token: session[:session_token])
        !user.nil?
    end

    def current_user
        # not currently logged in --> no session_token
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def log_in_user!(user)
        # takes in a user and sets the session[:session_token]
        # intialize current_user so it can be passed down to subclasses
        @current_user = user
        session[:session_token] = user.session_token
    end
end

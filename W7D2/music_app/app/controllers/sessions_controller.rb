class SessionsController < ApplicationController

    def new
        # user sign up page
        render :new
    end

    def create
        # don't assume that User is logged in
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        unless user.nil?
            user.reset_session_token!
            session[:session_token] = user.session_token
            render plain: "logged in"
        else 
            render plain: "invalid"
        end
        # redirect to page of what happens after session is made
    end

    # have a destroy for logout
    def destroy
        current_user.reset_session_token!
        # turning session to nil will make current_user (method) to be nil
        # the session[:session_token] does not pertain to any particular User
        session[:session_token] = nil 
        redirect_to new_session_url
    end
end

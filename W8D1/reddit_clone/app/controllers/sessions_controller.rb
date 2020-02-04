class SessionsController < ApplicationController

    before_action :require_login, only:[:destroy]

    def new
        render :new # render log in page
    end 

    def create
        # look for valid logins in db
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ['Invalid username or password']
            render :new   # send back to sign in page
        end
    end 

    def destroy
        logout 
        redirect_to new_session_url
    end

end

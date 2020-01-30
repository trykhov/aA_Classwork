class UsersController < ApplicationController

    def new
        # this is for users to sign up
        @user = User.new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to user_url(user)
        else 
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        user = User.find_by(id: params[:id])
        # redirect to session page to let user log out
        render :show
    end


    private
    def user_params
        # only need to have email and password
        # this will call the password= method and will set the password_digest
        # the after_initialize will kick in and added the session_token
        params.require(:user).permit(:email, :password)
    end

end

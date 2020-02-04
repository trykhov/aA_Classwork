class UsersController < ApplicationController
    before_action :require_login, only:[:edit]

    def new
        @user = User.new 
        render :new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else  
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])
        if !@user.update(user_params)
            flash[:errors] = @user.errors.full_messages
        end
        redirect_to user_url(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end 

    def index
        @users = User.all
        render :index
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end

class SubsController < ApplicationController
    before_action :require_login, except:[:show, :index] # anyone can access and see a subreddit
    # before_action only:[:edit, :update] { is_moderator?(params[:moderator_id]) }
    
    def new
        @sub = Sub.new 
        render :new
    end 

    def create
    end 

    def edit
        @sub = current_user.subs.find_by(id: params[:id])
    end 

    def update
    end 

    def destroy
        @sub = current_user.subs.find_by(id: params[:id])
        if @sub
            @sub.destroy
            redirect_to user_url(current_user)
        else  
            flash[:errors] = ['You are not the moderator. Permission is denied']
            redirect_to sub_url(@sub)
        end
    end 

    def show
    end 

    def index
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end

class CatsController < ApplicationController
    
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new # gives us a form page
        @cat = Cat.new
        render :new
    end

    def create  # does the actual creating
        cat = Cat.new(cat_params)

        if cat.save
            redirect_to cat_url(cat)
            # redirect ends a request and response cycle & intializes a new one
            # after save it redirects client to :show
        else
            render cat.errors.full_messages, status: 422
        end
    end 

    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end
    
    def update
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(cat_params)
            redirect_to cats_url # to see just updated cat: cat_url(cat)
        else
            render cat.errors.full_messages, status: 422
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end
end

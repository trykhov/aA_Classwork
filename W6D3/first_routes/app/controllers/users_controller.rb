class UsersController < ApplicationController

  def index
    if params.has_key?(:query)
      if !params[:query][:username].nil?
        user = User.find_by(username: params[:query][:username])
      else
        render json: user.errors.full_messages, status: 418
      end
    else 
      user = User.all
    end 
    render json: user 
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 418
    end
  end

  def show
    user = User.all
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else 
      render json: user.errors.full_messages, status: 418
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy

    render json: user
  end


  private
  def user_params
    params.require(:user).permit(:username)
  end


end

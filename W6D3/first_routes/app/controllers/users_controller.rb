class UsersController < ApplicationController

  def index
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
    user = User.new(params.require(:user).permit(:username))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def show
    user = User.all
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(params.require(:user).permit(:username))
      render json: user
    else 
      render json: user.errors.full_messages
    end
  end

  def delete
    user = User.find_by(id: params[:id])
    user.destroy

    render json: user
  end
end

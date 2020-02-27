class Api::SessionsController < ApplicationController

  before_action :require_logged_in!, only:[:destroy]

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ["Wrong credentials!"], status: 404
    else
      login!(@user)
      render 'api/users/show'
    end
  end


  def destroy
    logout!
    render json: {}
  end
end

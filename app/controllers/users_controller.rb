class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = user.find(params[:id])
  end
end

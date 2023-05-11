class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end

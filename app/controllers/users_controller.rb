class UsersController < ApplicationController

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:title, :body, :photo)
  end
end

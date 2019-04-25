class UsersController < ApplicationController

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
  end

  def update
    @user = User.find_by(id: params[:id])
    p params
    @user.name = params[:name]
    @user.country = params[:country]
    @user.save
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:title, :body, :photo, :country)
  end
end

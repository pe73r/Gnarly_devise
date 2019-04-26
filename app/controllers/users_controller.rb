class UsersController < ApplicationController

  def index
      @uploads = Upload.all
  end

  def new
    @user = User.new(user_params)
  end

  def edit
    @user = User.find(params[:id])
    @uploads = Upload.all
  end

  def create
    @user = User.new(user_params)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.country = params[:country]
    @user.save
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @uploads = Upload.all
  end

  def user_params
    params.require(:user).permit(:title, :body, :photo, :country, :name, :last_name)
  end
end


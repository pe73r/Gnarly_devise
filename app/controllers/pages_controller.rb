class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!, only: [:dashboard]

  def index
    @uploads = Upload.all
    if user_signed_in?
      redirect_to_dashboard_path
    end
  end

  def home
  end

  def dashboard
    @uploads = Upload.all
  end
end

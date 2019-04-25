class TagsController < ApplicationController
  def index
    redirect_to uploads_path
  end

  def show
     @tag = ActsAsTaggableOn::Tag.find(params[:id])
     @uploads = Upload.tagged_with(@tag.name)
  end
end

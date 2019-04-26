class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :set_upload, only: [:create]
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.upload = @upload

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.upload, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to upload_path(@comment.upload), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    def set_upload
      @upload = Upload.find(params[:upload_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end

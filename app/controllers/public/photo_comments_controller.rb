class Public::PhotoCommentsController < ApplicationController
  before_action :authenticate_member!


  def create
    @photo = Photo.find(params[:photo_id])
    @comments = @photo.photo_comments.all.order(created_at: :desc)
    @comment = current_member.photo_comments.new(photo_comment_params)
    @comment.photo_id = @photo.id
    if @comment.save
      render 'comment_area'
    else
      render 'comment_error'
    end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comments = @photo.photo_comments.all.order(created_at: :desc)
    @comment = PhotoComment.find(params[:id])
    @comment.destroy
    render 'comment_area'
  end

  private

  def photo_comment_params
    params.require(:photo_comment).permit(:comment)
  end

end

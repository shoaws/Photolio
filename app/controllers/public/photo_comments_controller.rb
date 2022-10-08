class Public::PhotoCommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    comment = current_member.photo_comments.new(photo_comment_params)
    comment.photo_id = @photo.id
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    @comment = PhotoComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
  
  private
  
  def photo_comment_params
    params.require(:photo_comment).permit(:comment)
  end
end

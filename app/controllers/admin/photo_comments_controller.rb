class Admin::PhotoCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @photo = Photo.find(params[:photo_id])
    @comments = @photo.photo_comments.all.order(created_at: :desc)
    PhotoComment.find(params[:id]).destroy
  end
  
end

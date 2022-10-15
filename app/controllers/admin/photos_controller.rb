class Admin::PhotosController < ApplicationController
  def index
    @photos = Photo.page(params[:page]).per(12)
  end

  def show
    @photo = Photo.find(params[:id])
    @member = @photo.member
    @comments = @photo.photo_comments.all.order(created_at: :desc)
  end
  
  def destroy
    photo = Photo.find(params[:id])
    member = photo.member
    photo.destroy
    redirect_to admin_member_path(member)
  end
  
end

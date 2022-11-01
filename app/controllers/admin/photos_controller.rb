class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin!

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

  def search
    @search_photos = Photo.search(params[:keyword])
    @photos = @search_photos.page(params[:page]).per(12)
    @keyword = params[:keyword]
    render :index
  end

  def search_tag
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @keyword = @tag.name
    @search_photos = @tag.photos
    @photos = @search_photos.page(params[:page]).per(12)
    render :index
  end

  def search_camera
    @cameras = Camera.all
    @camera = Camera.find(params[:camera_id])
    @keyword = @camera.name
    @search_photos = @camera.photos
    @photos = @search_photos.page(params[:page]).per(12)
    render :index
  end

end

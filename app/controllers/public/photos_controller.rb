class Public::PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.member_id = current_member.id
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def index
    @photos = Photo.page(params[:page]).per(12)
  end

  def show
    @photo = Photo.find(params[:id])
    @member = @photo.member
    @comment =PhotoComment.new
    @comments = @photo.photo_comments.all.order(created_at: :desc)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(photo)
    else
      render :edit
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to member_path(current_member)
  end

  def search
    @search_photos = Photo.search(params[:keyword])
    @photos = @search_photos.page(params[:page]).per(12)
    @keyword = params[:keyword]
    render "index"
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :body, :address, :latitude, :longitude, :member_id)
  end

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end

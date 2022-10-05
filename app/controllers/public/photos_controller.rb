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
      redirect_to request.referer
    end
  end
  
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @member = @photo.member
  end
  
  def destroy
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:image, :body, :address, :member_id)
  end
end

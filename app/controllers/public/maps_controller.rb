class Public::MapsController < ApplicationController
  def index
    @photo = Photo.find(params[:photo_id])
  end
  
end

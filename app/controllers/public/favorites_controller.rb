class Public::FavoritesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    favorite = current_member.favorites.new(photo_id: @photo.id)
    favorite.save
    render 'btn_change'
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    favorite = current_member.favorites.find_by(photo_id: @photo.id)
    favorite.destroy
    render 'btn_change'
  end
end
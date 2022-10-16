class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!

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

  def index
    @member = Member.find(params[:member_id])
    @best_photo = Photo.find_by(id: @member.best_photo_id)
    favorites = Favorite.where(member_id: @member.id).pluck(:photo_id)
    @photos = Photo.find(favorites)
    @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(9)
  end
end

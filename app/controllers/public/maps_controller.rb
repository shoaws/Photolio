class Public::MapsController < ApplicationController
  before_action :authenticate_member!

  def index
    @photo = Photo.find(params[:photo_id])
    @member = @photo.member
    @another_photos = Photo.where(address: @photo.address).where.not(id: @photo.id).where.not(member_id: current_member.id).order("RANDOM()").limit(3)
  end

end

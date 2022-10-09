class Public::MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
    @best_photo = Photo.find_by(id: @member.best_photo_id)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member)
  end

  def best_photo
    photo = Photo.find(params[:photo_id])
    current_member.best_photo_id = photo.id
    current_member.save
    redirect_to photo_path(photo)
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :nickname, :introduction, :phone_number, :is_deleted, :profile_image, :best_photo_id)
  end
end

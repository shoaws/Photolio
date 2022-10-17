class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :correct_member, only: [:edit, :update, :unsubscribe,:withdraw]

  def show
    @member = Member.find(params[:id])
    @photos = @member.photos.page(params[:page]).per(9)
    @best_photo = Photo.find_by(id: @member.best_photo_id)
  end

  def edit
    @member = Member.find(params[:id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member)
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def best_photo
    photo = Photo.find(params[:photo_id])
    current_member.best_photo_id = photo.id
    current_member.save
    redirect_to photo_path(photo)
  end

  def unsubscribe
    @member = Member.find_by(id: current_member.id)
  end

  def withdraw
    @member = Member.find_by(id: current_member.id)
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :nickname, :introduction, :phone_number, :is_deleted, :profile_image, :best_photo_id)
  end

  def correct_member
    member = Member.find(params[:id])
    unless member == current_member
      redirect_to member_path(current_member)
    end
  end

end

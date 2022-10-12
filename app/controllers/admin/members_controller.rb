class Admin::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to admin_member_path(member)
  end
  
  private
  
  def member_params
    params.require(:member).permit(:last_name, :first_name, :nickname, :introduction, :phone_number, :is_deleted, :profile_image, :best_photo_id)
  end
  
end

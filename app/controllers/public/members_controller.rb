class Public::MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  private
  
  def member_params
    params.require(:member).permit(:last_name, :first_name, :nickname, :introduction, :phone_number, :is_deleted, :profile_image, :best_image)
  end
end

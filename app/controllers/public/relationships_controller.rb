class Public::RelationshipsController < ApplicationController
  before_action :authenticate_member!

  def create
    current_member.follow(params[:member_id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:member_id])
    redirect_to request.referer
  end

  def followings
    @member = Member.find(params[:member_id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member)
    end
    @members = @member.followings
    if Rails.env.production?
      @random_members = Member.active_member.where.not(id: current_member.id).where.not(id: @members.ids).order("RAND()").limit(5)
    else
      @random_members = Member.active_member.where.not(id: current_member.id).where.not(id: @members.ids).order("RANDOM()").limit(5)
    end
  end

  def followers
    @member = Member.find(params[:member_id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member)
    end
    @members = @member.followers
  end

  def search
    @members = Member.search(params[:keyword]).active_member.where.not(id: current_member.id)
    @member_keyword = params[:keyword]
    if request.referer.include?("followings")
      @random_members = Member.active_member.where.not(id: current_member.id).where.not(id: @members.ids).order("RANDOM()").limit(5)
      render "followings"
    else
      render "followers"
    end
  end

end

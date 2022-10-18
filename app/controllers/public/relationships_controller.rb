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
    @random_members = Member.where.not(email: "guest@example.com").where.not(is_deleted: true).where.not(id: current_member.id).where.not(id: @members.ids).order("RANDOM()").limit(5)
  end

  def followers
    @member = Member.find(params[:member_id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member)
    end
    @members = @member.followers
  end

  def search
    @members = Member.search(params[:keyword]).where.not(email: "guest@example.com").where.not(id: current_member.id)
    @member_keyword = params[:keyword]
    if request.referer.include?("followings")
      @random_members = Member.where.not(email: "guest@example.com").where.not(is_deleted: true).where.not(id: current_member.id).where.not(id: @members.ids).order("RANDOM()").limit(5)
      render "followings"
    else
      render "followers"
    end
  end

end

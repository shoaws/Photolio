class Public::RelationshipsController < ApplicationController

  def create
    current_member.follow(params[:member_id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:member_id])
    redirect_to request.referer
  end

  def followings
    member = Member.find(params[:member_id])
    @members = member.followings
    @random_members = Member.where.not(email: "guest@example.com").where.not(id: current_member.id).where.not(id: @members.ids).order("RANDOM()").limit(5)
  end

  def followers
    member = Member.find(params[:member_id])
    @members = member.followers
  end
end
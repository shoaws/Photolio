class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @members = Member.page(params[:page]).per(10)
  end

  def search
    @search_members = Member.admin_search(params[:keyword])
    @members = @search_members.page(params[:page]).per(10)
    @member_keyword = params[:keyword]
    render "top"
  end
end

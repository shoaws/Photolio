class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @members = Member.page(params[:page]).per(6)
  end

  def search
    @search_members = Member.admin_search(params[:keyword]).where(is_deleted: params[:is_deleted_search])
    @members = @search_members.page(params[:page]).per(6)
    @member_keyword = params[:keyword]
    if params[:is_deleted_search] == 'false'
      @is_deleted_search = "有効"
    else
      @is_deleted_search = "退会"
    end
    render "top"
  end
end

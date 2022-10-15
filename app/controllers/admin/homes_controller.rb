class Admin::HomesController < ApplicationController
  def top
    @members = Member.page(params[:page]).per(10)
  end
end

class Admin::HomesController < ApplicationController
  def top
    @members = Member.all
  end
end

class AdminsController < ApplicationController
  before_action :authenticate_member!,
  def index
    @member = Member.all
    @subjects = Subject.all
    @sub_mem = Subject.where(member_id:[current_member.id] )
  end

  def show

  end
  def manageuser

  end

  # def deactivate
  #   @member = Member.find(params[:id])
  #   if @member.access_locked?
  #     @member.unlock_access!
  #   else
  #     @member.lock_access!
  #   end
  #   render 'manageuser'
  # end

end

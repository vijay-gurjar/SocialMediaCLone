class MembersController < ApplicationController
  before_action :authenticate_member!



  def index
      @member = Member.all
      if current_member.has_role? 'admin'
        @subject = Subject.all.order("created_at DESC")
      else
        @subject = Subject.where(status: :public).or(Subject.where(member: current_member)).order("created_at DESC")

      end


  end

  def import
    Member.import(params[:file])
  end

def reports
  @member = Member.all
  @subject = Subject.all



  respond_to do |format|
    format.html

    format.csv { send_data @member.to_csv, filename: "User's Report-#{DateTime.current}.csv" }
    format.xls { send_data @member.to_csv(col_sep: "\t"), filename: "User's Report-#{DateTime.current}.xls" }
  end
end


  def sorted
    @member = Member.all
    @subject = Subject.all



    respond_to do |format|
      format.html

      format.csv { send_data @member.sorted, filename: "User's Sorted Report-#{DateTime.current}.xls" }
      format.xls { send_data @member.sorted(col_sep: "\t"), filename: "User's Sorted Report-#{DateTime.current}.xls" }
    end
  end





  def show
    @member = Member.all
  end
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.add_role params[:roles]
    @member.save
    if @member.save
      MemberMailer.member_signedup.deliver_later
      flash[:notice] = "Successfully created User."
      redirect_to '/members/new'
    else
      render :action => 'new'
    end
  end

  def deactivate
    @members = Member.find(params[:id])
    if @members.access_locked?
      @members.unlock_access!
    else
      @members.lock_access!
    end
    render 'members/show', notice: ' Member access locked: #{@member.access_locked}'
  end





  private
  def member_params
    params.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :role)
  end


end
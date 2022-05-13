class SubjectsController < ApplicationController
  # before_action :set_subject, only: %i[ show edit update destroy ]

  before_action :authenticate_member!
  # GET /subjects or /subjects.json
  def index
    @subject = Subject.where(status: :public).or(Subject.where(member: current_member)).order("created_at DESC")

  end

  # GET /subjects/1 or /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params_home)
    @subject.member = current_member
    respond_to do |format|
      if @subject.save
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    @subject = Subject.find(params[:id])
    if  @subject = Subject.update(subject_params)
      redirect_to(subject_path(@subject))
    else
      render 'edit'
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_path, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
      end
  end


  def sortreported
    @member = Member.all
    @subject = Subject.all

    respond_to do |format|
      format.html

      format.csv { send_data @subject.post_wise,  filename: "User's Post-Wise Report-#{DateTime.current}.csv" }
      format.xls { send_data @subject.post_wise(col_sep: "\t"), filename: "User's Post-Wise Report-#{DateTime.current}.xls" }
    end
  end






  private


    # Use callbacks to share common setup or constraints between actions.
    # def set_subject
    #   @subject = Subject.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:title, :body, :status, :member_id, :first_name, :last_name)
    end
  def subject_params_home
    params.permit(:title, :body, :status,:member_id, :first_name, :last_name)
  end

  end
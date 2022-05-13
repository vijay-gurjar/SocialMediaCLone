class CommentsController < ApplicationController
  # before_action :authenticate_member!,
  def create
    @subject = Subject.find(params[:subject_id])

    @comment = @subject.comments.create(comment_params)
    redirect_to subject_path(@subject)
  end
  def edit
    @subject = Subject.find(params[:subject_id])
    @comment = @subject.comments.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    @comment = @subject.comments.find(comment_param)
    if @comment.update(comment_params)
      redirect_to @subject
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @comment = @subject.comments.find(params[:id])
    @comment.destroy

    redirect_to subject_path(@subject), status: 303
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end




class LikesController < ApplicationController

  def create
    @like = current_member.likes.new(like_params)
    if !@like.save
      flash[:notice] = "Post not Liked"
      else
    redirect_to @like.subject
    end
  end


  def destroy
    @like = current_member.like.find(params[:id])
    subject = @like.subject
    @like.destroy
    redirect_to subject

  end

  private
  def like_params

    params.require(:like).permit(:subject_id)
  end

end

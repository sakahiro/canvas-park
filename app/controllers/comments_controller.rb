# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @work = Work.find(comment_params[:work_id])
    if @comment.save
      redirect_to work_url(@work)
    else
      @comments = @work.comments.all
      render 'works/show'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to work_url(comment.work)
  end

  private

  def comment_params
    params.require(:comment).permit(:work_id, :content)
  end
end

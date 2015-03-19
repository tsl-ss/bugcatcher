class CommentsController < ApplicationController
  before_action :set_report
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = @report.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      if @comment.report.release.project.owner == current_user
        CommentsMailer.comment_from_project_owner(@comment).deliver_now
      else
        CommentsMailer.comment_to_project_owner(@comment).deliver_now
      end
    end
    redirect_to release_report_url(@report.release, @report)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_report
    @report = Report.find(params[:report_id])
  end

  def set_comment
    @comment = @report.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :attachment)
  end

end


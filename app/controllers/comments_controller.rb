class CommentsController < ApplicationController
  before_action :set_report
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
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
    @report = Report.first
  end

  def set_comment
    @comment = @report.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :report_id)
  end

end


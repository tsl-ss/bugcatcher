class ReportsController < ApplicationController

  before_action :set_release
  before_action :set_report, :only => [:show]
  before_action :set_report_with_current_user, :only => [:edit, :destroy, :update]

  def new
    @report = Report.new
  end

  def show
    @comments = @report.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    @report = @release.reports.find(params[:id])
    @report.update(report_params)
    redirect_to [@release, @report]
  end

  def destroy
    @report.destroy
    flash[:notice] = "Report deleted successfully."
    redirect_to [@release.project, @release]
  end

  def create
    @report = Report.new(report_params)
    @report.release_id = params[:release_id]
    @report.author = current_user
    @report.save

    redirect_to [@release, @report]
  end

private

  def set_report
    @report = Report.find(params[:id])
  end

  def set_report_with_current_user
    @report = current_user.reports.find(params[:id])
  end

  def set_release
    @release = Release.find(params[:release_id])
  end

  def report_params
    params.require(:report).permit(:content)
  end

end

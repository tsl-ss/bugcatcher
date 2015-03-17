class ReportsController < ApplicationController
  before_action :set_report_project_and_release, :only => [:show, :edit, :update, :destroy]

  def new
    @project = params[:project_id]
    @release = params[:release_id]
    @report = Report.new
  end

  def show
  end

  def edit
  end

  def update
    @report = Report.new(report_params)
    @report.save
    redirect_to project_release_report_url(params[:project_id], params[:release_id], @report)
  end

  def destroy
    @report.destroy
    flash[:notice] = "Report deleted successfully."
    redirect_to project_release_url(@project, @release)
  end

  def create
    @report = Report.new(report_params)
    @report.release_id = params[:release_id]
    @report.save
    redirect_to project_release_report_url(params[:project_id], params[:release_id], @report)
  end

  def report_params
    params.require(:report).permit(:content)
  end

  def set_report_project_and_release
    @report = Report.find(params[:id])
    @project = params[:project_id]
    @release = params[:release_id]
  end


end

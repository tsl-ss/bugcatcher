class ReportsController < ApplicationController

  def new
    @project = params[:project_id]
    @release = params[:release_id]
    @report = Report.new
  end

  def show
  end

  def edit
  end

  def delete
  end

  def create
    @report = Report.new(report_params)
    @report.release_id = params[:release_id]
    @report.save
  end

  def report_params
    params.require(:report).permit(:content)
  end

end

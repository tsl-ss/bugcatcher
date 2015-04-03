class ReportStatusController < ApplicationController

  def update
    @report = Report.find(params[:id])
    @report.accepted_by_project_owner = params[:accepted_by_project_owner]
    @report.save

    respond_to { |format| format.js }
  end

end

class ReportsController < ApplicationController
  before_action :set_project, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_release, only: [:edit, :show, :update, :close, :destroy]
  before_action :set_report, only: [:show]

  def new
  end

  def show
    @comment = @report.comments.build
  end

  def edit
  end

  def delete
  end

  def create
  end


  private

    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_report
      @report = Report.find(params[:id])
    end
    def set_release
      @relesae = Release.find(params[:release_id])
    end

    def report_params
      params.require(:report).permit(:content, :release_id)
    end

end

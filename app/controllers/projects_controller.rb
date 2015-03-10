class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def show
    @screenshots = @project.screenshots
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to :back, notice: 'Project was successfully updated.'
    else
      render 'edit'
    end

  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :url)
    end
end

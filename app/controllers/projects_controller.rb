class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def show
  end

  def new
    @project = Project.new
  end

  def edit
    @project.screenshots.build
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render 'edit'
    end

  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :url, screenshots_attributes: [:id, :image, :_destroy])
    end
end

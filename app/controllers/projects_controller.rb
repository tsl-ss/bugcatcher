class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def show
    @screenshots = @project.screenshots
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def update
    if params[:delete_logo] == "1"
      @project.logo = nil
    end
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
      params.require(:project).permit(:name, :logo, :description, :url, screenshots_attributes: [:id, :image, :_destroy])
    end
end

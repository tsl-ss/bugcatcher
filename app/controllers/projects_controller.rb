class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.all
    @projects = Project.order(:name).page params[:page]
  end

  def show
    @project = Project.find(params[:id])
    @screenshots = @project.screenshots
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def new
    @project = current_user.projects.new
    @project.screenshots.build
  end

  def edit
    @project.screenshots.build
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

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private

    def set_project
      @project =  current_user.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :logo, :description, :url, screenshots_attributes: [:id, :image, :_destroy])
    end
end

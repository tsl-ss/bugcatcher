class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  before_action :authorize_user, :only => [:create, :edit, :update, :destroy]


  def authorize_user

    unless current_user == @project.user_id
      redirect_to root_url, :alert => "Access denied. Not authorized for this action."
    end
  end


  def index
    @projects = Project.all
  end

  def show
    @screenshots = @project.screenshots
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def new
    @project = Project.new
    @project.screenshots.build
  end

  def edit
  end

  def update
    @project.user_id = current_user

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
    redirect_to project_release_path, notice: 'Project was successfully destroyed.'
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :logo, :description, :url, screenshots_attributes: [:id, :image, :_destroy])
    end
end

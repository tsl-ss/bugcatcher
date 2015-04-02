class ReleasesController < ApplicationController
  before_action :set_project, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_release, only: [:edit, :show, :update, :close, :destroy]
  before_action :authenticate_user!, :except => [:show]

  def new
    @release = @project.releases.build
    @release.screenshots.build
  end

  def create
    @release = @project.releases.open.build(release_params)
    if @release.save
      redirect_to [@project, @release]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @release.update(release_params)
      redirect_to [@project, @release], notice: 'Release was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
    @screenshots = @release.screenshots
  end

  def destroy
    @release.destroy
    redirect_to @project, notice: 'Release was successfully deleted'
  end

private

  def set_project
    @project = if current_user.present?
      current_user.projects.find(params[:project_id])
    else
      Project.find(params[:project_id])
    end
  end

  def set_release
    @release = @project.releases.find(params[:id])
  end

  def release_params
    params.require(:release).permit(
      :title,
      :logo,
      :description,
      :open,
      screenshots_attributes: [:id, :image, :_destroy]
    )
  end

end

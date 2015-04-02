class ReleasesController < ApplicationController
  before_action :set_project, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_release, only: [:edit, :show, :update, :close, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy, :close]

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

  def close
    @release.close_release!
    @release.save
    redirect_to :back
  end

  def destroy
    @release.destroy
    redirect_to @project, notice: 'Release was successfully deleted'
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_release
      @release = Release.find(params[:id])
    end

    def release_params
      params.require(:release).permit(:title, :logo, :description, screenshots_attributes: [:id, :image, :_destroy])
    end
end

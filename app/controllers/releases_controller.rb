class ReleasesController < ApplicationController
  before_action :set_project, only: [:new, :create, :edit, :update, :show]
  before_action :set_release, only: [:edit, :show, :update, :close]

  def new
    @release = @project.releases.build
    @release.screenshots.build
  end

  def create
    @release = @project.releases.open.build(release_params)
    if @release.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @release.update(release_params)
      redirect_to @project, notice: 'Release was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
  end

  def close
    @release.close_release!
    @release.save
    redirect_to :back
  end

  def delete
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

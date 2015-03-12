class ReleasesController < ApplicationController
  before_action :set_project, only: [:new, :edit]

  def new
    @release = @project.releases.build
    @release.screenshots.build
  end

  def create

  end

  def edit
    @release = Release.find(:release_id)
  end

  def show
  end

  def delete
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end
end

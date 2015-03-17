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

  def close
    #replace after merging with the set release before_action
    @release = Release.find(params[:id])
    @release.close_release
    @release.save
    redirect_to :back
  end

  def delete
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end
end

class ReleasesController < ApplicationController
  def new
  end

  def edit
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
end

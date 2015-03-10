class ProjectsController < ApplicationController
  before_action 

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end
end

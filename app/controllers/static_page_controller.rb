class StaticPageController < ApplicationController
  def home
    @projects = Project.limit(6)
  end
end

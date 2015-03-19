class LeaderboardController < ApplicationController

  def index
    interval = params[:interval].present? ? params[:interval].to_sym : :alltime
    @leaderboard = User.leaderboard(interval)

    respond_to do |format|
      format.js
      format.html
    end
  end

end

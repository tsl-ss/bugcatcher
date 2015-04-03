class LeaderboardController < ApplicationController

  def show
    @leaderboard = Leaderboard.fetch(params[:interval].present?)

    respond_to do |format|
      format.js
      format.html
    end
  end

end

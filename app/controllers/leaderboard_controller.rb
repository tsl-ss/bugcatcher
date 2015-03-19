class LeaderboardController < ApplicationController

  def index
    @leaderboard = User.leaderboard(:alltime)
  end

end

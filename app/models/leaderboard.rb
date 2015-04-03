class Leaderboard

  def self.fetch(just_current_month = false)
    query = Report.accepted

    if just_current_month
      query = query.where("created_at > ?", Date.today.beginning_of_month)
    end

    query = query.select("COUNT(*) as score, reports.author_id as author_id")
    query = query.includes(:author)
    query = query.group("reports.author_id").order("score DESC")
  end

  def self.score_for(user, just_current_month = false)
    result = self.fetch(just_current_month)
    user_entry = result.find { |entry| entry.author_id == user.id }
    user_entry.score if user_entry.present?
  end

  # A similar approach could be achieved by just using plain sql,
  # it actually leads to a easier to read code and result set.
  # For example, the following method. would return a an array of hashes
  # like this:
  #
  # [{"score"=>"2", "author_id"=>"3"}, {"score"=>"1", "author_id"=>"1"}]
  #
  # That's is a perfect result but the problem is that whenever you need
  # to loop through thi result set and render the author name and other
  # information it would be necessary to execute a new database query
  # to get the User since the result set only contains the id and not
  # the object. By using Rails methods like the implementation above
  # we could call includes(:author) and Rails will also load all the
  # users and create the objects for us, making the process of looping
  # through the leaderboard and rendering the associated user for
  # efficient. So the decision to go with or another depends only on
  # the necessity to render the user or not.

  # def self.fetch(only_current_month = false)
  #   @connection ||= ActiveRecord::Base.connection

  #   current_month_condition = if only_current_month
  #     "AND reports.created_at > date('#{Date.today.beginning_of_month}')"
  #   end

  #   sql  = "SELECT COUNT(*) AS score, reports.author_id AS user_id
  #           FROM reports INNER JOIN users ON users.id = reports.author_id
  #           WHERE reports.accepted_by_project_owner = 't'
  #           #{current_month_condition}
  #           GROUP BY reports.author_id
  #           ORDER BY score DESC;"


  #   @connection.execute(sql).to_a
  # end

end
require 'test_helper'

class LeaderboardTest < ActiveSupport::TestCase

  # This class is important to test. I would test both methods.
  #
  # For the fetch method I would with just_current_month and without to
  # see if the method returns the right values. I would check for
  # the sorting as well and also to make sure it is aggregating the score
  # correctly.
  #
  # score_for would be easier to test, you just need to make sure it returns
  # the right score for the given user and also to check what happens when
  # the user has no score or when the given user doesn't exist.

end

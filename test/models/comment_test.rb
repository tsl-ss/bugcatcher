require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def test_user_comment_count
    user = users(:daniel)
    comment_count = user.comments.count
    new_comment = user.comments.new
    new_comment.save
    assert_equal(comment_count + 1, user.comments.count)
  end

  def test_report_comment_count
    report = reports(:first_report)
    comment_count = report.comments.count
    new_comment = report.comments.new
    new_comment.save
    assert_equal(comment_count + 1, report.comments.count)
  end

end

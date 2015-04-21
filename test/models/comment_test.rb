require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def test_required_attributes_for_creation
    new_comment = Comment.new

    assert(!new_comment.valid?)
    assert(new_comment.errors.messages[:text].present?)
    assert(new_comment.errors.messages[:report].present?)
    assert(new_comment.errors.messages[:user].present?)

    user = users(:daniel)
    report = reports(:first_report)

    new_comment.text = "Lorem"
    new_comment.user = user
    new_comment.report = report

    assert(new_comment.valid?)
    new_comment.save!
  end

  def test_user_and_report_comment_count
    user = users(:daniel)
    user_comment_count = user.comments.count

    report = reports(:first_report)
    report_comment_count = report.comments.count

    new_comment = Comment.new(:text => "lorem", :user => user, :report => report)
    new_comment.save!

    assert_equal(user_comment_count + 1, user.comments.count)
    assert_equal(report_comment_count + 1, report.comments.count)
  end

end

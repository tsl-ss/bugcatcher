require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  # Very nice - if you want to test for validations that's fine
  # I would just test the most important ones (and specially the custom ones)
  # Other than the validations I don't think I would test anything else on
  # comments model.

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

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_if_user_valid
    user = users(:marcus)

    assert_equal true, user.valid?

  end

  # test "the truth" do
  #   user = users(:daniel)
  #   puts User.first
  #   assert_equal true, user.valid?
  # end

end

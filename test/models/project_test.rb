require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  # On projects I think the only thing I would test is this validation:
  # validates :name, presence: true, uniqueness: { scope: :user_id }
  # Specially the uniqueness. Because it would prevent the user to create
  # a project if you delete this by accident and I'm pretty sure the users
  # would never reported the bad UX. Everything else is straightforward and
  # easy to fix if you let a mistake pass.

end
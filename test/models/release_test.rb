require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase

  def test_required_attributes_for_creation
    project = projects(:lantern)
    nr = project.releases.new

    assert(!nr.valid?)
    assert(nr.errors.messages[:title].present?)
    assert(nr.errors.messages[:description].present?)

    nr.title = "Test"
    nr.description = "Cool..."
    assert(nr.valid?)
    nr.save!
  end

  def test_open_and_closed_scopes
    open_release = releases(:discussions)
    closed_release = releases(:assignments)

    assert_equal(Release.open, [open_release])
    assert_equal(Release.closed, [closed_release])
  end

  def test_that_should_be_just_one_open_release
    project = projects(:lantern)
    nr = project.releases.new(title: "Test", description: "...")
    nr.save!
    assert_equal 1, project.releases.open.count
    assert_equal nr, project.releases.open.first
  end

end
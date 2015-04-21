require 'test_helper'

class ReportTest < ActiveSupport::TestCase

  def test_report_accepted_by_project_owner_scope
    report1 = reports(:first_report)
    report2 = reports(:second_report)

    # Test for report1
    assert_equal(Report.accepted, [report1])

    # Test for report2
    refute_equal(Report.accepted, [report2])
  end

end

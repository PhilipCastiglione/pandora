# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  done_on    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  test "draw! sets done_on to current date" do
    activity = activities(:one)
    travel_to Date.new(2021, 1, 1) do
      activity.draw!
      assert_equal Date.current, activity.done_on
    end
  end
end

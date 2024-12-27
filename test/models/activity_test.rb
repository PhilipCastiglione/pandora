# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  drawn_on   :date
#  idea       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  test "draw! sets drawn_on to current date" do
    activity = activities(:one)
    travel_to Date.new(2021, 1, 1) do
      activity.draw!
      assert_equal Date.current, activity.drawn_on
    end
  end
end

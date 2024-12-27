# == Schema Information
#
# Table name: gifts
#
#  id         :integer          not null, primary key
#  event      :string
#  person     :string
#  purchased  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class GiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

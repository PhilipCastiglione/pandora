# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "label should be present and unique" do
    tag = Tag.new
    assert_not tag.valid?
    assert_equal [ "can't be blank" ], tag.errors[:label]

    tag.label = "ruby"
    assert tag.valid?

    tag.save!
    tag = Tag.new(label: "ruby")
    assert_not tag.valid?
    assert_equal [ "has already been taken" ], tag.errors[:label]
  end
end

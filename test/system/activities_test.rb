require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    skip()
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "should create activity" do
    skip()
    visit activities_url
    click_on "New activity"

    fill_in "Drawn on", with: @activity.drawn_on
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "should update Activity" do
    skip()
    visit activity_url(@activity)
    click_on "Edit this activity", match: :first

    fill_in "Drawn on", with: @activity.drawn_on.to_s
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Activity" do
    skip()
    visit activity_url(@activity)
    click_on "Destroy this activity", match: :first

    assert_text "Activity was successfully destroyed"
  end
end

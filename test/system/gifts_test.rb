require "application_system_test_case"

class GiftsTest < ApplicationSystemTestCase
  setup do
    @gift = gifts(:one)
  end

  test "visiting the index" do
    skip()
    visit gifts_url
    assert_selector "h1", text: "Gifts"
  end

  test "should create gift" do
    skip()
    visit gifts_url
    click_on "New gift"

    fill_in "Event", with: @gift.event
    fill_in "Person", with: @gift.person
    check "Purchased" if @gift.purchased
    click_on "Create Gift"

    assert_text "Gift was successfully created"
    click_on "Back"
  end

  test "should update Gift" do
    skip()
    visit gift_url(@gift)
    click_on "Edit this gift", match: :first

    fill_in "Event", with: @gift.event
    fill_in "Person", with: @gift.person
    check "Purchased" if @gift.purchased
    click_on "Update Gift"

    assert_text "Gift was successfully updated"
    click_on "Back"
  end

  test "should destroy Gift" do
    skip()
    visit gift_url(@gift)
    click_on "Destroy this gift", match: :first

    assert_text "Gift was successfully destroyed"
  end
end

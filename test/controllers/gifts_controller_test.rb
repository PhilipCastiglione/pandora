require "test_helper"

class GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gift = gifts(:one)
  end

  test "should not get index when not authenticated" do
    get gifts_url
    assert_redirected_to new_session_url
  end

  test "should get index when authenticated" do
    sign_in(users(:one))

    get gifts_url
    assert_response :success
  end

  test "should not get new when not authenticated" do
    get new_gift_url
    assert_redirected_to new_session_url
  end

  test "should get new when authenticated" do
    sign_in(users(:one))

    get new_gift_url
    assert_response :success
  end

  test "should not create gift when not authenticated" do
    assert_no_difference("Gift.count") do
      post gifts_url, params: { gift: { person: "foo", event: "bar" } }
    end

    assert_redirected_to new_session_url
  end

  test "should create gift when authenticated" do
    sign_in(users(:one))

    assert_difference("Gift.count") do
      post gifts_url, params: { gift: { person: "foo", event: "bar" } }
    end

    assert_redirected_to gift_url(Gift.last)
  end

  test "should not show gift when not authenticated" do
    get gift_url(@gift)
    assert_redirected_to new_session_url
  end

  test "should show gift when authenticated" do
    sign_in(users(:one))

    get gift_url(@gift)
    assert_response :success
  end

  test "should not get edit when not authenticated" do
    get edit_gift_url(@gift)
    assert_redirected_to new_session_url
  end

  test "should get edit when authenticated" do
    sign_in(users(:one))

    get edit_gift_url(@gift)
    assert_response :success
  end

  test "should not update gift when not authenticated" do
    patch gift_url(@gift), params: { gift: { person: "foo", event: "bar" } }
    assert_redirected_to new_session_url
  end

  test "should update gift when authenticated" do
    sign_in(users(:one))

    patch gift_url(@gift), params: { gift: { person: "foo", event: "bar" } }
    assert_redirected_to gift_url(@gift)
  end

  test "should not destroy gift when not authenticated" do
    assert_no_difference("Gift.count") do
      delete gift_url(@gift)
    end

    assert_redirected_to new_session_url
  end

  test "should destroy gift when authenticated" do
    sign_in(users(:one))

    assert_difference("Gift.count", -1) do
      delete gift_url(@gift)
    end

    assert_redirected_to gifts_url
  end
end

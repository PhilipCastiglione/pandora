require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  test "should not get draw when not authenticated" do
    post draw_activity_url(@activity)
    assert_redirected_to new_session_url
  end

  test "should get draw when authenticated" do
    sign_in(users(:one))

    post draw_activity_url(@activity)
    assert_redirected_to drawn_activity_url(@activity)
  end

  test "should not get drawn when not authenticated" do
    get drawn_activity_url(@activity)
    assert_redirected_to new_session_url
  end

  test "should get drawn when authenticated" do
    sign_in(users(:one))

    get drawn_activity_url(@activity)
    assert_response :success
  end

  test "should not get index when not authenticated" do
    get activities_url
    assert_redirected_to new_session_url
  end

  test "should get index when authenticated" do
    sign_in(users(:one))

    get activities_url
    assert_response :success
  end

  test "should not get new when not authenticated" do
    get new_activity_url
    assert_redirected_to new_session_url
  end

  test "should get new when authenticated" do
    sign_in(users(:one))

    get new_activity_url
    assert_response :success
  end

  test "should not create activity when not authenticated" do
    assert_no_difference("Activity.count") do
      post activities_url, params: { activity: { drawn_on: @activity.drawn_on } }
    end

    assert_redirected_to new_session_url
  end

  test "should create activity when authenticated" do
    sign_in(users(:one))

    assert_difference("Activity.count") do
      post activities_url, params: { activity: { drawn_on: @activity.drawn_on } }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should not show activity when not authenticated" do
    get activity_url(@activity)
    assert_redirected_to new_session_url
  end

  test "should show activity when authenticated" do
    sign_in(users(:one))

    get activity_url(@activity)
    assert_response :success
  end

  test "should not get edit when not authenticated" do
    get edit_activity_url(@activity)
    assert_redirected_to new_session_url
  end

  test "should get edit when authenticated" do
    sign_in(users(:one))

    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should not update activity when not authenticated" do
    patch activity_url(@activity), params: { activity: { drawn_on: @activity.drawn_on } }
    assert_redirected_to new_session_url
  end

  test "should update activity when authenticated" do
    sign_in(users(:one))

    patch activity_url(@activity), params: { activity: { drawn_on: @activity.drawn_on } }
    assert_redirected_to activity_url(@activity)
  end

  test "should not destroy activity when not authenticated" do
    assert_no_difference("Activity.count") do
      delete activity_url(@activity)
    end

    assert_redirected_to new_session_url
  end

  test "should destroy activity when authenticated" do
    sign_in(users(:one))

    assert_difference("Activity.count", -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to activities_url
  end
end

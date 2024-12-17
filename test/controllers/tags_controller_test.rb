require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should not get index when not authenticated" do
    get tags_url
    assert_redirected_to new_session_url
  end

  test "should get index when authenticated" do
    sign_in(users(:one))

    get tags_url
    assert_response :success
  end

  test "should not get new when not authenticated" do
    get new_tag_url
    assert_redirected_to new_session_url
  end

  test "should get new when authenticated" do
    sign_in(users(:one))

    get new_tag_url
    assert_response :success
  end

  test "should not create tag when not authenticated" do
    assert_no_difference("Tag.count") do
      post tags_url, params: { tag: { label: "new label" } }
    end

    assert_redirected_to new_session_url
  end

  test "should create tag when authenticated" do
    sign_in(users(:one))

    assert_difference("Tag.count") do
      post tags_url, params: { tag: { label: "new label" } }
    end

    assert_redirected_to tag_url(Tag.last)
  end

  test "should not show tag when not authenticated" do
    get tag_url(@tag)
    assert_redirected_to new_session_url
  end

  test "should show tag when authenticated" do
    sign_in(users(:one))

    get tag_url(@tag)
    assert_response :success
  end

  test "should not get edit when not authenticated" do
    get edit_tag_url(@tag)
    assert_redirected_to new_session_url
  end

  test "should get edit when authenticated" do
    sign_in(users(:one))

    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should not update tag when not authenticated" do
    patch tag_url(@tag), params: { tag: { label: @tag.label } }
    assert_redirected_to new_session_url
  end

  test "should update tag when authenticated" do
    sign_in(users(:one))

    patch tag_url(@tag), params: { tag: { label: @tag.label } }
    assert_redirected_to tag_url(@tag)
  end

  test "should not destroy tag when not authenticated" do
    assert_no_difference("Tag.count") do
      delete tag_url(@tag)
    end

    assert_redirected_to new_session_url
  end

  test "should destroy tag when authenticated" do
    sign_in(users(:one))

    assert_difference("Tag.count", -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_url
  end
end

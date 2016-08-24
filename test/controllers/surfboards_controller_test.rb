require 'test_helper'

class SurfboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surfboard = surfboards(:one)
  end

  test "should get index" do
    get surfboards_url
    assert_response :success
  end

  test "should get new" do
    get new_surfboard_url
    assert_response :success
  end

  test "should create surfboard" do
    assert_difference('Surfboard.count') do
      post surfboards_url, params: { surfboard: { color: @surfboard.color, length_in_cm: @surfboard.length_in_cm, size: @surfboard.size } }
    end

    assert_redirected_to surfboard_url(Surfboard.last)
  end

  test "should show surfboard" do
    get surfboard_url(@surfboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_surfboard_url(@surfboard)
    assert_response :success
  end

  test "should update surfboard" do
    patch surfboard_url(@surfboard), params: { surfboard: { color: @surfboard.color, length_in_cm: @surfboard.length_in_cm, size: @surfboard.size } }
    assert_redirected_to surfboard_url(@surfboard)
  end

  test "should destroy surfboard" do
    assert_difference('Surfboard.count', -1) do
      delete surfboard_url(@surfboard)
    end

    assert_redirected_to surfboards_url
  end
end

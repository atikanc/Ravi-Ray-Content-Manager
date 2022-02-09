require "test_helper"

class DisplayLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @display_line = display_lines(:one)
  end

  test "should get index" do
    get display_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_display_line_url
    assert_response :success
  end

  test "should create display_line" do
    assert_difference('DisplayLine.count') do
      post display_lines_url, params: { display_line: { ComponentContributed: @display_line.ComponentContributed, ComponentEndDate: @display_line.ComponentEndDate, ComponentStartDate: @display_line.ComponentStartDate } }
    end

    assert_redirected_to display_line_url(DisplayLine.last)
  end

  test "should show display_line" do
    get display_line_url(@display_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_display_line_url(@display_line)
    assert_response :success
  end

  test "should update display_line" do
    patch display_line_url(@display_line), params: { display_line: { ComponentContributed: @display_line.ComponentContributed, ComponentEndDate: @display_line.ComponentEndDate, ComponentStartDate: @display_line.ComponentStartDate } }
    assert_redirected_to display_line_url(@display_line)
  end

  test "should destroy display_line" do
    assert_difference('DisplayLine.count', -1) do
      delete display_line_url(@display_line)
    end

    assert_redirected_to display_lines_url
  end
end

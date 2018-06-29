require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @user.save!
  end
  
  test "calendars index page should be accessible" do
    login @user
    get calendars_index_path
    assert_response :success
  end

  test "calendars index page should not be accessible without login" do
    get calendars_index_path
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @user.save!
  end
  
  test "calendars index page should be accessible" do
    login @user
    get users_calendar_path
    assert_template :show
    assert_response :success
  end

  test "calendars index page should not be accessible without login" do
    get users_calendar_path
    assert_template nil
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

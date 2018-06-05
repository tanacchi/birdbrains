require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should top page exists" do
    get home_top_url
    assert_response :success
  end

  test "should sign in function works" do
    get home_signin_url
    assert_response :redirect
  end

  test "should sign out function works" do
    get home_signout_url
    assert_response :redirect
  end

  test "should sign up function works" do
    get home_signup_url
    assert_response :redirect
  end
end

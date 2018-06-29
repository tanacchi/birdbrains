require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "top page should exist" do
    get root_url
    assert_response :success
  end

  test "sign up page should exits" do
    get signup_url
    assert_response :success
  end

  test "sign in function should exist" do
    get signin_url
    assert_response :success
  end

  test "sign out action should work" do
    get signout_url
    assert_response :redirect
    assert_redirected_to root_url
  end
end

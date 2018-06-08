require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should top page exists" do
    get root_url
    assert_response :success
  end

  test "should sign up function works" do
    get signup_url
    assert_response :success
  end

  test "should sign in function works" do
    get signin_url
    assert_response :success
  end
  
  test "should sign out function works" do
    get signout_url
    assert_response :redirect
  end
end

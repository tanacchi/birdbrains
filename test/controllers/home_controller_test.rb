require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @user.save!
  end

  test "top page should exist" do
    get root_path
    assert_response :success
  end

  test "sign up page should exits" do
    get signup_path
    assert_response :success
  end

  test "sign in page should exist" do
    get signin_path
    assert_response :success
  end

  test "check_user action should assign valid user" do
    post signin_path(session: { name: @user.name, email: @user.email })
    assert_response :redirect
    assert_redirected_to users_path
  end

  test "check_user action should reject invalid user" do
    post signin_path(session:
                      { name: (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join,
                        email: @user.email })
    assert_response :redirect
    assert_redirected_to signin_path
  end
  
  test "sign out action should work" do
    get signout_path
    assert_response :redirect
    assert_redirected_to root_path
  end
end

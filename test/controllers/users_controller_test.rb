require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @user.save!
  end

  def teardown
    logout
  end

  test "users show page should be accessible" do
    login @user
    get users_path
    assert_response :success
  end

  test "users show page should not be accessible without login" do
    get users_path
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

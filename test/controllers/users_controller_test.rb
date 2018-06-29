require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @user.save!
    login @user
  end

  def teardown
    logout
  end

  test "user creater should work" do
    post users_path :user => {:name => 'test_name', :email => 'test@test'}
    assert_response :redirect
  end
end

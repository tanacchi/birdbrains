require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "user creater should work" do
    post users_path :user => {:name => 'test_name', :email => 'test@test'}
    assert_response :redirect
  end
end

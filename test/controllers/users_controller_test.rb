require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "show page should work" do
  #   assert true 
  # end

  test "user creater work" do
    post users_path :user => {:name => 'test_name', :email => 'test@test'}
    assert_response :redirect
  end
end

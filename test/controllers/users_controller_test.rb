require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should users home exits" do
    get user_url
    assert_response :success
  end
end

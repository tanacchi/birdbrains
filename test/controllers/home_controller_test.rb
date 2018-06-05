require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should top page exists" do
    get home_top_url
    assert_response :success
  end

  test "should sign in page exists" do
    get home_signin_url
    assert_response :success
  end
end

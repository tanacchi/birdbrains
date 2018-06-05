require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should top page exist" do
    get home_top_url
    assert_response :success
  end
end

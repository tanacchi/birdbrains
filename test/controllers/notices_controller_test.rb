require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post users_notices_path
    assert_response :success
  end

  test "should get destroy" do
    # delete notice_path()
    # assert_response :success
  end

end

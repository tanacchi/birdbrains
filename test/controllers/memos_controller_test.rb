require 'test_helper'

class MemosControllerTest < ActionDispatch::IntegrationTest
  test "memos show page should not be accessed without login" do
    @memos = memos(:memo0)
    get users_memos_url(@memos)
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test "new page should be exist" do
    get new_users_memos_url
    assert_response :success
  end
end

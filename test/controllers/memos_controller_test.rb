require 'test_helper'

class MemosControllerTest < ActionDispatch::IntegrationTest
  test "show page should be exist" do
    get users_memos_url(id: 1)
    assert_response :success
  end

  test "new page should be exist" do
    get new_users_memos_url
    assert_response :success
  end
end

require 'test_helper'

class MemosControllerTest < ActionDispatch::IntegrationTest
  test "show page should be exist" do
    get memos_url(id: 1)
    assert_response :success
  end
end

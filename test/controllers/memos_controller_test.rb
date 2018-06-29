require 'test_helper'

class MemosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @memo = memos(:memo0)
    @user = @memo.user
    @memo.save!
  end

  test "memos show page should be accessible" do
    login @user
    get users_memos_path(id: @memo)
    assert_response :success
  end

  test "memos show page should not be accessible without login" do
    get users_memos_path(id: @memo)
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

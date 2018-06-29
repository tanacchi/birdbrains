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

  test "memos create action should create new memo" do
    login @user
    assert_difference('Memo.count') do
      post users_memos_path(memo: { title: 'test_title', body: 'test_body'})
    end
    assert_response :redirect
    assert_redirected_to users_memos_path(id: assigns(:memo))
  end

  test "memos create action should not create new memo without login" do
    assert_no_difference('Memo.count') do
      post users_memos_path(memo: { title: 'test_title', body: 'test_body'})
    end
    assert_response :redirect
    assert_redirected_to signin_path
  end

  test "memos edit page should be accessible" do
    login @user
    get edit_users_memos_path(id: @memo)
    assert_response :success
  end

  test "memos edit page should not be accessible without login" do
    get edit_users_memos_path(id: @memo)
    assert_response :redirect
    assert_redirected_to signin_path
  end

  test "memos update action should modify memos attuributes" do
    login @user
    patch users_memos_path(id: @memo, memo: { title: @memo.title+"_updated" })
    assert_response :redirect
    assert_redirected_to users_memos_path(id: @memo)
  end

  test "memos update action should not modify memos attuributes without login" do
    patch users_memos_path(id: @memo, memo: { title: @memo.title+"_updated" })
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

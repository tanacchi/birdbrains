require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @user.save!
  end

  def teardown
    logout
  end

  test "users show page should be accessible" do
    login @user
    get users_path
    assert_template :show, layout: 'frame', partial: 'user'
    assert_response :success
  end

  test "users show page should not be accessible without login" do
    get users_path
    assert_template nil
    assert_response :redirect
    assert_redirected_to signin_path
  end

  test "users create action should create valid user" do
    assert_difference('User.count') do
      post signup_path(user: { name: 'test_name', email: 'test@email'})
    end
    assert_template nil
    assert_response :redirect
    assert_redirected_to users_path
  end

  test "users create action should reject invalid user" do
    assert_no_difference('User.count') do
      post signup_path(user: { name: @user.name, email: @user.email})
    end
    assert_template nil
    assert_response :redirect
    assert_redirected_to signup_path
  end

  test "users edit page should be accessible" do
    login @user
    get edit_users_path
    assert_template :edit, layout: 'application'
    assert_response :success
  end

  test "users edit page should not be accessible without login" do
    get edit_users_path
    assert_template nil
    assert_response :redirect
    assert_redirected_to signin_path
  end

  test "users update action should modify users attributes" do
    login @user
    patch users_path(user: { name: @user.name+"_updated"})
    assert_template nil
    assert_response :redirect
    assert_redirected_to users_path
  end

  test "users update action should not be accessible without login" do
    patch users_path(user: { name: @user.name+"_updated"})
    assert_template nil
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user0)
  end

  test "valid user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = '     '
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = 'a' * 21
    assert_not @user.valid?
  end

  test "name should not be too short" do
    @user.name = 'as'
    assert_not @user.valid?
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end

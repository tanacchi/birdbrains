class HomeHelperTest < ActionView::TestCase
  include HomeHelper
  
  def setup
    @user = users(:user0)
  end
  
  test "log_in method returns user id" do
    user_id = log_in @user
    assert_equal @user.id, user_id
  end

  test "current_user should return user who logged in" do
    log_in @user
    assert_equal @user, current_user
  end

  test "log_out method should make current_user nil" do
    log_in @user
    assert_not_nil current_user
    log_out
    assert_nil current_user
  end

  test "logged_in? method should check log in or out" do
    log_in @user
    assert_equal true, logged_in?
    log_out
    assert_equal false, logged_in?
  end
end

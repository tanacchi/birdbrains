require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: 'name', email: 'test@mail')
    @user.save!
    @reminder = @user.reminders.build(name: 'name')
  end

  test "reminders index page should be accessible" do
    login @user
    get users_reminders_path
    assert_template :index
    assert_response :success
  end

  test "reminders index page should be accessible without login" do
    get users_reminders_path
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

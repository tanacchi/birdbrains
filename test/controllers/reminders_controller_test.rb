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

  test "reminders create action should create new memo" do
    login @user
    assert_difference('Reminder.count') do
      post users_reminders_path(reminder: { name: 'test_name'})
    end
    assert_template nil
    assert_response :redirect
    assert_redirected_to reminder_path(id: assigns(:reminder))
  end

  test "memos create action should not create new memo without login" do
    assert_no_difference('Reminder.count') do
      post users_reminders_path(reminder: { title: 'test_name' })
    end
    assert_template nil
    assert_response :redirect
    assert_redirected_to signin_path
  end
end

require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  def setup
    @reminder = Reminder.new(name: 'Test Reminder', user_id: 1)
  end
  
  test "reminders name should be present" do
    @reminder.name = "  ";
    assert_not @reminder.valid?
  end

  test "reminders name shold not be longer than 20" do
    @reminder.name = 'a'*21
    assert_not @reminder.valid?    
  end
end

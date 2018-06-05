require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'example@mail.jp')
  end

  test "should new user valid" do
    assert @user.valid?
  end
end

require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  def setup
    @memo = Memo.new(title: 'Example Memo', body: 'Example text',
                     user_id: 1, made_time: DateTime.now, updated_time: DateTime.now)
  end

  test "should be valid" do
    assert @memo.valid?
  end
  
  test "user_id should not be nil" do
    @memo.user_id = nil
    assert_not @memo.valid?
  end

  test "should belong to a present user" do
    @memo.user_id = 1145141919810
    assert_not @memo.valid?
  end

  test "title should not too long" do
    @memo.title = 'M'*31
    assert_not @memo.valid?
  end
end

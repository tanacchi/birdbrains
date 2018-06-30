require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  def setup
    @memo = memos(:memo0)
  end

  test "valid memo should be valid" do
    assert @memo.valid?
  end
  
  test "memos user_id should not be nil" do
    @memo.user_id = nil
    assert_not @memo.valid?
  end

  test "memo should belong to a present user" do
    @memo.user_id = 1145141919810
    assert_not @memo.valid?
  end

  test "memos title should not too long" do
    @memo.title = 'M'*31
    assert_not @memo.valid?
  end
end

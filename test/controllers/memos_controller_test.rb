require 'test_helper'

class MemosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @memo = memos(:memo0)
    @memo.save!
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all

  def login(user)
    post signin_path(session: { name: user.name, email: user.email })
  end

  def logout
    get signout_path
  end
end

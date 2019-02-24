require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "john doe", password: "password")
    @message = Message.create(body: "What's on your mind guys?", user: @user)
  end

  test "valid message" do
    assert @message.valid?
  end

  test "body should be present" do
    @message.body = ""
    assert_not @message.valid?
  end

  test "body should not be very large" do
    @message.body = "a" * 101
    assert_not @message.valid?
  end
end

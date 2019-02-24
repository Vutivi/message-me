require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user  = User.create(username: "vutivi", password: "password")
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "username is present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username length is equal or greater than 3" do
    @user.username = "ab"
    assert_not @user.valid?
  end

  test "username is unique" do
    user = User.create(username: "vutivi", password: "password1")
    assert_not user.valid?
  end

end

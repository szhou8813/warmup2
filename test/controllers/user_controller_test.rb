require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end

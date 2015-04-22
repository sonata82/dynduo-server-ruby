require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    basic_auth_login
    get :index
    assert_response :success
  end

  test "should fail" do
    get :index
    assert_response :unauthorized
  end

end

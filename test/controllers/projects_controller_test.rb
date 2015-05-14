require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    basic_auth_login
    get :index
    assert_response :success
  end

  test "should respond when jsonp is used" do
    @request.headers["Accept"] = "*/*"
    get :index, callback: "callback"
    assert_response :success
  end

  test "should respond when jsonp is used, even for IE" do
    @request.headers["Accept"] = "application/javascript, */*;q=0.8"
    get :index, callback: "callback"
    assert_response :success
  end
end

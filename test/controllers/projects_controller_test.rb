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

end

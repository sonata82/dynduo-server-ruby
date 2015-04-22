require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    basic_auth_login
    get :index
    assert_response :success
  end

  test "should respond when json is used" do
    @request.headers['Accept'] = Mime::JSON
    get :index
    assert_response :success
  end

end

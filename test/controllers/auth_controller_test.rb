require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get logout" do
    get :logout
    assert_response :success
  end

end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

end

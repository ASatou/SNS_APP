require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "invalid signup form" do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, params: { user: { full_name: "   ",
                                     name: "   ",
                                     email: "user@example",
                                     password: "foo", password_confirmation: "bar" }}
    end
    assert_template 'users/new'
  end
  
end

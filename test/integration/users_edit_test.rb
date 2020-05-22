require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end
  
  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@a" }}
    assert_template 'users/edit'
  end
  
  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "user"
    email = "user@example.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
  
  
end

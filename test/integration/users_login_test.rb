require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end
  
  test "login with valid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path params: {session: { email: @user.email, password: 'password'} }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    follow_redirect!
    assert_template 'sessions/new'
  end
  
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path params: {session: { email: "  ", password: "  "}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "authenticated? should return false when user's remember_digest is nil" do
    assert_not @user.authenticated?('')
  end
  
  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies[:remember_token]
  end
  
  test "login without remembering" do
    log_in_as(@user, remember_me: '1')
    delete logout_path
    log_in_as(@user, remember_me: '0')
    assert_empty cookies[:remember_token]
  end
  
  
end
